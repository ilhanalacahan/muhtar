import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/app_database.dart';
import '../../providers.dart';
import '../../services/printer_service.dart';
import 'package:intl/intl.dart';

class TahakkukListScreen extends ConsumerStatefulWidget {
  final int? donemId;
  const TahakkukListScreen({super.key, this.donemId});
  @override
  ConsumerState<TahakkukListScreen> createState() => _TahakkukListScreenState();
}

class _TahakkukListScreenState extends ConsumerState<TahakkukListScreen> {
  List<TahakkuklarData> _tahakkuklar = [];
  Map<int, AbonelerData> _aboneler = {};
  Map<int, DonemlerData> _donemler = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final db = ref.read(dbProvider);
    final tahakkuklar = widget.donemId != null
        ? await db.getTahakkuklarByDonem(widget.donemId!)
        : await (db.select(db.tahakkuklar)..limit(100)).get();

    final aboneler = await db.getAboneler();
    final donemler = await db.getDonemler();

    if (mounted) {
      setState(() {
        _tahakkuklar = tahakkuklar;
        _aboneler = {for (var a in aboneler) a.id: a};
        _donemler = {for (var d in donemler) d.id: d};
        _loading = false;
      });
    }
  }

  Future<void> _showTahsilatDialog(TahakkuklarData tahakkuk) async {
    final db = ref.read(dbProvider);
    final kalan = await db.getKalanBakiye(tahakkuk.id);

    if (!mounted) return;

    final tutarCtrl = TextEditingController(text: kalan.toStringAsFixed(2));
    final aciklamaCtrl = TextEditingController();
    final messenger = ScaffoldMessenger.of(context);

    final result = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Tahsilat Ekle'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Kalan Bakiye: ${kalan.toStringAsFixed(2)} TL',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: tutarCtrl,
              decoration: const InputDecoration(
                labelText: 'Tahsilat Tutarı',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: aciklamaCtrl,
              decoration: const InputDecoration(
                labelText: 'Açıklama (opsiyonel)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c),
            child: const Text('İptal'),
          ),
          FilledButton(
            onPressed: () async {
              final tutar = double.tryParse(tutarCtrl.text) ?? 0;
              if (tutar <= 0) {
                ScaffoldMessenger.of(c).showSnackBar(
                  const SnackBar(content: Text('Geçerli tutar giriniz')),
                );
                return;
              }
              await db.createTahsilat(
                tahakkukId: tahakkuk.id,
                tarih: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                tutar: tutar,
                odemeTipi: 'Nakit',
                aciklama: aciklamaCtrl.text.trim().isEmpty
                    ? null
                    : aciklamaCtrl.text.trim(),
              );
              // ignore: use_build_context_synchronously
              Navigator.pop(c, true);
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );

    if (result == true) {
      await _loadData();
      messenger.showSnackBar(
        const SnackBar(content: Text('Tahsilat kaydedildi')),
      );
    }
  }

  Future<void> _printMakbuz(TahakkuklarData tahakkuk) async {
    final db = ref.read(dbProvider);
    final settings = await db.getSettings();
    final abone = _aboneler[tahakkuk.aboneId];
    final donem = _donemler[tahakkuk.donemId];

    if (!mounted) return;
    final messenger = ScaffoldMessenger.of(context);

    if (settings == null || abone == null || donem == null) {
      messenger.showSnackBar(const SnackBar(content: Text('Veri eksik')));
      return;
    }

    final kalan = await db.getKalanBakiye(tahakkuk.id);
    final odenen = tahakkuk.tutar - kalan;

    try {
      final printerService = PrinterService();
      if (!printerService.isConnected()) {
        messenger.showSnackBar(
          const SnackBar(content: Text('Yazıcı bağlı değil')),
        );
        return;
      }

      await printerService.printMakbuz(
        antetBaslik: settings.antetBaslik ?? 'MUHTAR',
        antetAdres: settings.antetAdres ?? '',
        altBilgi: settings.altBilgi ?? 'Tesekkur ederiz',
        aboneAd: '${abone.ad} ${abone.soyad ?? ''}',
        aboneNo: abone.aboneNo,
        donem: donem.ad,
        ilkEndeks: tahakkuk.ilkEndeks ?? 0.0,
        sonEndeks: tahakkuk.sonEndeks ?? 0.0,
        tuketim: tahakkuk.tuketimM3 ?? 0.0,
        birimFiyat: tahakkuk.birimFiyat,
        tutar: tahakkuk.tutar,
        odenen: odenen,
        kalan: kalan,
        tarih: DateFormat('dd.MM.yyyy').format(DateTime.now()),
      );

      messenger.showSnackBar(
        const SnackBar(content: Text('Makbuz yazdırıldı')),
      );
    } catch (e) {
      debugPrintStack(label: 'Yazdırma hatası: $e');
      messenger.showSnackBar(SnackBar(content: Text('Yazıcı hatası: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahakkuklar')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _tahakkuklar.isEmpty
          ? const Center(child: Text('Henüz tahakkuk oluşturulmamış'))
          : ListView.builder(
              itemCount: _tahakkuklar.length,
              itemBuilder: (c, i) {
                final t = _tahakkuklar[i];
                final abone = _aboneler[t.aboneId];
                final donem = _donemler[t.donemId];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: ListTile(
                    title: Text(
                      abone != null
                          ? '${abone.ad} ${abone.soyad ?? ''}'
                          : 'Abone #${t.aboneId}',
                    ),
                    subtitle: Text(
                      'Dönem: ${donem?.ad ?? 'Bilinmeyen'}\nTutar: ${t.tutar.toStringAsFixed(2)} TL',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.payment, color: Colors.green),
                          onPressed: () => _showTahsilatDialog(t),
                        ),
                        IconButton(
                          icon: const Icon(Icons.print, color: Colors.blue),
                          onPressed: () => _printMakbuz(t),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

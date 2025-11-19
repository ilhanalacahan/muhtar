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
      appBar: AppBar(title: const Text('Tahakkuklar'), elevation: 0),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _tahakkuklar.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Henüz tahakkuk oluşturulmamış',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _tahakkuklar.length,
              itemBuilder: (c, i) {
                final t = _tahakkuklar[i];
                final abone = _aboneler[t.aboneId];
                final donem = _donemler[t.donemId];
                return _buildTahakkukCard(t, abone, donem);
              },
            ),
    );
  }

  Widget _buildTahakkukCard(
    TahakkuklarData tahakkuk,
    AbonelerData? abone,
    DonemlerData? donem,
  ) {
    final db = ref.read(dbProvider);

    // Durum rengi ve ikonu
    Color durumColor;
    String durumText;
    IconData durumIcon;

    switch (tahakkuk.durum) {
      case 'tamamlandi':
        durumColor = Colors.green;
        durumText = 'Ödendi';
        durumIcon = Icons.check_circle;
        break;
      case 'kismen_odendi':
        durumColor = Colors.orange;
        durumText = 'Kısmi';
        durumIcon = Icons.timelapse;
        break;
      default:
        durumColor = Colors.red;
        durumText = 'Ödenmedi';
        durumIcon = Icons.pending;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: durumColor.withOpacity(0.3), width: 1.5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Detay görüntüleme eklenebilir
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Üst kısım: Abone adı ve durum badge
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xFF0F4C81),
                    child: Text(
                      abone?.ad[0].toUpperCase() ?? 'A',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          abone != null
                              ? '${abone.ad}${abone.soyad != null ? ' ${abone.soyad}' : ''}'
                              : 'Abone #${tahakkuk.aboneId}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Abone No: ${abone?.aboneNo ?? '-'}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: durumColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: durumColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(durumIcon, size: 14, color: durumColor),
                        const SizedBox(width: 4),
                        Text(
                          durumText,
                          style: TextStyle(
                            color: durumColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              // Orta kısım: Dönem ve tüketim bilgileri
              Row(
                children: [
                  Expanded(
                    child: _buildInfoColumn(
                      Icons.calendar_month,
                      'Dönem',
                      donem?.ad ?? 'Bilinmeyen',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInfoColumn(
                      Icons.water_drop,
                      'Tüketim',
                      '${tahakkuk.tuketimM3?.toStringAsFixed(1) ?? '0'}',
                      Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Alt kısım: Tutar bilgileri ve aksiyonlar
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Toplam Tutar',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        Text(
                          '${tahakkuk.tutar.toStringAsFixed(2)} ₺',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    FutureBuilder<double>(
                      future: db.getKalanBakiye(tahakkuk.id),
                      builder: (context, snapshot) {
                        final kalan = snapshot.data ?? 0;
                        final odenen = tahakkuk.tutar - kalan;

                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Ödenen',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  '${odenen.toStringAsFixed(2)} ₺',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Kalan',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  '${kalan.toStringAsFixed(2)} ₺',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kalan > 0
                                        ? Colors.red
                                        : Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Aksiyon butonları
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _showTahsilatDialog(tahakkuk),
                      icon: const Icon(Icons.payment, size: 18),
                      label: const Text('Tahsilat'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green,
                        side: const BorderSide(color: Colors.green),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _printMakbuz(tahakkuk),
                      icon: const Icon(Icons.print, size: 18),
                      label: const Text('Yazdır'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F4C81),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    color: color.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

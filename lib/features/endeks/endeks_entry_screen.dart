import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/app_database.dart';
import '../../providers.dart';
import 'package:intl/intl.dart';

class EndeksEntryScreen extends ConsumerStatefulWidget {
  final AbonelerData abone;
  const EndeksEntryScreen({super.key, required this.abone});
  @override
  ConsumerState<EndeksEntryScreen> createState() => _EndeksEntryScreenState();
}

class _EndeksEntryScreenState extends ConsumerState<EndeksEntryScreen> {
  final _endeksCtrl = TextEditingController();
  final _okuyanCtrl = TextEditingController();
  final _aciklamaCtrl = TextEditingController();
  bool _loading = false;
  bool _loadingPrevious = true;
  EndekslerData? _previousEndeks;
  DonemlerData? _selectedDonem;
  List<DonemlerData> _donemler = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final db = ref.read(dbProvider);
    final prev = await db.getLastEndeks(widget.abone.id);
    final donemler = await db.getDonemler();
    if (mounted) {
      setState(() {
        _previousEndeks = prev;
        _donemler = donemler;
        _selectedDonem = donemler.isNotEmpty ? donemler.last : null;
        _loadingPrevious = false;
      });
    }
  }

  Future<void> _submit() async {
    final endeksValue = double.tryParse(_endeksCtrl.text);
    if (endeksValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Geçerli bir endeks giriniz')),
      );
      return;
    }

    if (_selectedDonem == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Dönem seçiniz')));
      return;
    }

    // Validate against previous reading
    if (_previousEndeks != null && endeksValue < _previousEndeks!.endeks) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: const Text('Uyarı'),
          content: Text(
            'Yeni endeks (${endeksValue.toStringAsFixed(2)}) önceki endeksten (${_previousEndeks!.endeks.toStringAsFixed(2)}) düşük. Devam etmek istiyor musunuz?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(c, false),
              child: const Text('İptal'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(c, true),
              child: const Text('Devam Et'),
            ),
          ],
        ),
      );
      if (confirm != true) return;
    }

    setState(() => _loading = true);

    try {
      final db = ref.read(dbProvider);
      final tarih = DateFormat('yyyy-MM-dd').format(DateTime.now());

      // Create endeks
      final endeksId = await db.createEndeks(
        aboneId: widget.abone.id,
        tarih: tarih,
        endeks: endeksValue,
        okuyanKisi: _okuyanCtrl.text.trim().isEmpty
            ? null
            : _okuyanCtrl.text.trim(),
        aciklama: _aciklamaCtrl.text.trim().isEmpty
            ? null
            : _aciklamaCtrl.text.trim(),
      );

      // Calculate tahakkuk
      final settings = await db.getSettings();
      final birimFiyat = settings?.suM3Fiyat ?? 0.0;
      final ilkEndeks = _previousEndeks?.endeks ?? 0.0;
      final tuketim = (endeksValue - ilkEndeks).clamp(0.0, double.infinity);
      final tutar = tuketim * birimFiyat;

      await db.createTahakkuk(
        aboneId: widget.abone.id,
        donemId: _selectedDonem!.id,
        ilkEndeksId: _previousEndeks?.id,
        sonEndeksId: endeksId,
        ilkEndeks: ilkEndeks,
        sonEndeks: endeksValue,
        tuketimM3: tuketim,
        birimFiyat: birimFiyat,
        tutar: tutar,
        olusturmaTarihi: tarih,
      );

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Endeks ve tahakkuk kaydedildi')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Hata: $e')));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Endeks Gir')),
      body: _loadingPrevious
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abone: ${widget.abone.ad} ${widget.abone.soyad ?? ''}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Abone No: ${widget.abone.aboneNo}'),
                        if (_previousEndeks != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Son Endeks: ${_previousEndeks!.endeks.toStringAsFixed(2)} (${_previousEndeks!.tarih})',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ] else ...[
                          const SizedBox(height: 8),
                          const Text(
                            'İlk endeks girişi',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (_donemler.isNotEmpty) ...[
                  DropdownButtonFormField<DonemlerData>(
                    initialValue: _selectedDonem,
                    decoration: const InputDecoration(
                      labelText: 'Dönem',
                      border: OutlineInputBorder(),
                    ),
                    items: _donemler
                        .map(
                          (d) => DropdownMenuItem(value: d, child: Text(d.ad)),
                        )
                        .toList(),
                    onChanged: (val) => setState(() => _selectedDonem = val),
                  ),
                  const SizedBox(height: 16),
                ],
                TextField(
                  controller: _endeksCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Yeni Endeks',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _okuyanCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Okuyan Kişi (opsiyonel)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _aciklamaCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Açıklama (opsiyonel)',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 50,
                  child: FilledButton.icon(
                    icon: _loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.save),
                    label: const Text('Kaydet ve Tahakkuk Oluştur'),
                    onPressed: _loading ? null : _submit,
                  ),
                ),
              ],
            ),
    );
  }
}

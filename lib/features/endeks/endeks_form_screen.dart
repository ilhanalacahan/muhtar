import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../db/app_database.dart';
import '../../providers.dart';

class EndeksFormScreen extends ConsumerStatefulWidget {
  final AbonelerData abone;

  const EndeksFormScreen({super.key, required this.abone});

  @override
  ConsumerState<EndeksFormScreen> createState() => _EndeksFormScreenState();
}

class _EndeksFormScreenState extends ConsumerState<EndeksFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _endeksController = TextEditingController();
  final _aciklamaController = TextEditingController();

  EndekslerData? _lastEndeks;
  DonemlerData? _selectedDonem;
  List<DonemlerData> _availableDonemler = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final db = ref.read(dbProvider);

    // Son endeksi yükle
    final lastEndeks = await db.getLastEndeks(widget.abone.id);

    // Güncel tarihe uygun dönemleri yükle
    final allDonemler = await db.getDonemler();
    final now = DateTime.now();
    final availableDonemler = allDonemler.where((d) {
      final baslangic = DateTime.tryParse(d.baslangicTarihi);
      final bitis = DateTime.tryParse(d.bitisTarihi);
      if (baslangic == null || bitis == null) return false;

      // Güncel tarih dönem aralığında mı?
      return now.isAfter(baslangic.subtract(const Duration(days: 1))) &&
          now.isBefore(bitis.add(const Duration(days: 1)));
    }).toList();

    setState(() {
      _lastEndeks = lastEndeks;
      _availableDonemler = availableDonemler;
      if (availableDonemler.isNotEmpty) {
        _selectedDonem = availableDonemler.first;
      }
    });
  }

  @override
  void dispose() {
    _endeksController.dispose();
    _aciklamaController.dispose();
    super.dispose();
  }

  Future<void> _showDonemPicker() async {
    if (_availableDonemler.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Güncel tarihe uygun dönem bulunamadı'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.event, color: Color(0xFF0F4C81)),
                  const SizedBox(width: 8),
                  const Text(
                    'Dönem Seçin',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(height: 24),
              ..._availableDonemler.map((d) {
                final baslangic = DateTime.tryParse(d.baslangicTarihi);
                final bitis = DateTime.tryParse(d.bitisTarihi);
                final dateFormat = DateFormat('dd MMM yyyy');

                return ListTile(
                  selected: _selectedDonem?.id == d.id,
                  selectedTileColor: const Color(0xFF0F4C81).withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  leading: Icon(
                    _selectedDonem?.id == d.id
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: _selectedDonem?.id == d.id
                        ? const Color(0xFF0F4C81)
                        : Colors.grey,
                  ),
                  title: Text(
                    d.ad,
                    style: TextStyle(
                      fontWeight: _selectedDonem?.id == d.id
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(
                    baslangic != null && bitis != null
                        ? '${dateFormat.format(baslangic)} - ${dateFormat.format(bitis)}'
                        : '${d.baslangicTarihi} - ${d.bitisTarihi}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedDonem = d;
                    });
                    Navigator.pop(context);
                  },
                );
              }),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedDonem == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dönem seçmelisiniz'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final db = ref.read(dbProvider);
      final endeks = double.parse(_endeksController.text);
      final aciklama = _aciklamaController.text.trim();

      await db.transaction(() async {
        // Endeks kaydı oluştur
        await db.createEndeks(
          aboneId: widget.abone.id,
          tarih: DateTime.now().toIso8601String(),
          endeks: endeks,
          okuyanKisi: 'Muhtar',
          aciklama: aciklama.isEmpty ? null : aciklama,
        );

        // Tahakkuk oluştur (mecburi)
        if (_selectedDonem != null && _lastEndeks != null) {
          // Sayaç durumuna göre tüketim hesaplama
          double tuketim;
          final saatDurumu = widget.abone.saatDurumu;

          if (saatDurumu == 'ters') {
            // Ters sayaçta: önceki - yeni (pozitif değer elde etmek için)
            tuketim = _lastEndeks!.endeks - endeks;
          } else {
            // Normal ve arızalı sayaçta: yeni - önceki
            tuketim = endeks - _lastEndeks!.endeks;
          }

          final ayarlar = await db.getSettings();
          final birimFiyat = ayarlar?.suM3Fiyat ?? 0.0;
          final tutar = tuketim * birimFiyat;

          await db.createTahakkuk(
            aboneId: widget.abone.id,
            donemId: _selectedDonem!.id,
            ilkEndeks: _lastEndeks!.endeks,
            sonEndeks: endeks,
            tuketimM3: tuketim,
            birimFiyat: birimFiyat,
            tutar: tutar,
            olusturmaTarihi: DateTime.now().toIso8601String(),
          );
        }
      });

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Endeks kaydedildi ve tahakkuk oluşturuldu'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayaç Oku'),
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          else
            IconButton(icon: const Icon(Icons.check), onPressed: _save),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Abone bilgi kartı
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: const Color(0xFF0F4C81),
                      child: Text(
                        widget.abone.ad[0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
                            '${widget.abone.ad}${widget.abone.soyad != null ? ' ${widget.abone.soyad}' : ''}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Abone No: ${widget.abone.aboneNo}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          if (widget.abone.saatNo != null)
                            Text(
                              'Sayaç No: ${widget.abone.saatNo}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Son endeks bilgisi
            if (_lastEndeks != null)
              Card(
                elevation: 2,
                color: Colors.blue.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Colors.blue.shade700,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Son Endeks',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${_lastEndeks!.endeks.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            Text(
                              DateFormat(
                                'dd MMM yyyy',
                              ).format(DateTime.parse(_lastEndeks!.tarih)),
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),

            // Yeni endeks girişi
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.speed, color: Color(0xFF0F4C81)),
                        const SizedBox(width: 8),
                        const Text(
                          'Yeni Endeks Girişi',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    TextFormField(
                      controller: _endeksController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Sayaç İçi *',
                        suffixText: '',
                        hintText: 'Sayaç değerini giriniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.water_drop),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Endeks giriniz';
                        }
                        final endeks = double.tryParse(value);
                        if (endeks == null) {
                          return 'Geçerli sayı giriniz';
                        }

                        // Sayaç durumuna göre validasyon
                        if (_lastEndeks != null) {
                          final saatDurumu = widget.abone.saatDurumu;

                          if (saatDurumu == 'ters') {
                            // Ters sayaçta yeni endeks küçük olmalı
                            if (endeks >= _lastEndeks!.endeks) {
                              return 'Ters sayaçta yeni endeks son endeksten (${_lastEndeks!.endeks.toStringAsFixed(0)}) küçük olmalı';
                            }
                          } else {
                            // Normal ve arızalı sayaçta yeni endeks büyük olmalı
                            if (endeks < _lastEndeks!.endeks) {
                              return 'Yeni endeks son endeksten (${_lastEndeks!.endeks.toStringAsFixed(0)}) küçük olamaz';
                            }
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _aciklamaController,
                      decoration: InputDecoration(
                        labelText: 'Açıklama (Opsiyonel)',
                        hintText: 'Ör: Normal okuma',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.note),
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tahakkuk oluştur
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.receipt_long,
                          color: Color(0xFF2E7D32),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Tahakkuk',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    const Text(
                      'Tahakkuk oluşturmak için dönem seçiniz *',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: _showDonemPicker,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Color(0xFF0F4C81),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Dönem',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _selectedDonem?.ad ?? 'Dönem seçiniz',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: _selectedDonem != null
                                          ? FontWeight.w500
                                          : FontWeight.normal,
                                      color: _selectedDonem != null
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      ),
                    ),
                    if (_availableDonemler.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Güncel tarihe uygun dönem bulunamadı',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.orange.shade700,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: _isLoading ? null : _save,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: const Color(0xFF0F4C81),
            ),
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'KAYDET',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column;
import '../../db/app_database.dart';
import '../../providers.dart';
import 'package:intl/intl.dart';

class DonemFormScreen extends ConsumerStatefulWidget {
  final DonemlerData? donem;

  const DonemFormScreen({super.key, this.donem});

  @override
  ConsumerState<DonemFormScreen> createState() => _DonemFormScreenState();
}

class _DonemFormScreenState extends ConsumerState<DonemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _adController;
  DateTime? _baslangicTarihi;
  DateTime? _bitisTarihi;
  DateTime? _sonOdemeTarihi;
  bool _isLoading = false;
  bool _canEdit = true;

  @override
  void initState() {
    super.initState();
    _adController = TextEditingController(text: widget.donem?.ad ?? '');

    if (widget.donem != null) {
      _baslangicTarihi = DateTime.tryParse(widget.donem!.baslangicTarihi);
      _bitisTarihi = DateTime.tryParse(widget.donem!.bitisTarihi);
      if (widget.donem!.sonOdemeTarihi != null) {
        _sonOdemeTarihi = DateTime.tryParse(widget.donem!.sonOdemeTarihi!);
      }
      _checkIfCanEdit();
    }
  }

  Future<void> _checkIfCanEdit() async {
    if (widget.donem != null) {
      final db = ref.read(dbProvider);
      final canEdit = await db.canDeleteOrEditDonem(widget.donem!.id);
      setState(() {
        _canEdit = canEdit;
      });
    }
  }

  @override
  void dispose() {
    _adController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, String type) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: type == 'baslangic'
          ? _baslangicTarihi ?? DateTime.now()
          : type == 'bitis'
          ? _bitisTarihi ?? DateTime.now()
          : _sonOdemeTarihi ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (type == 'baslangic') {
          _baslangicTarihi = picked;
        } else if (type == 'bitis') {
          _bitisTarihi = picked;
        } else {
          _sonOdemeTarihi = picked;
        }
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_baslangicTarihi == null || _bitisTarihi == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Başlangıç ve bitiş tarihleri seçilmelidir'),
        ),
      );
      return;
    }

    // Düzenleme modunda ve tahakkuk varsa engelle
    if (widget.donem != null && !_canEdit) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Bu döneme ait tahakkuklar bulunduğu için düzenlenemez',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final db = ref.read(dbProvider);

      if (widget.donem == null) {
        await db.createDonem(
          ad: _adController.text,
          baslangicTarihi: _baslangicTarihi!.toIso8601String(),
          bitisTarihi: _bitisTarihi!.toIso8601String(),
          sonOdemeTarihi: _sonOdemeTarihi?.toIso8601String(),
        );

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dönem başarıyla eklendi')),
        );
      } else {
        await db.updateDonem(
          widget.donem!.id,
          DonemlerCompanion(
            ad: Value(_adController.text),
            baslangicTarihi: Value(_baslangicTarihi!.toIso8601String()),
            bitisTarihi: Value(_bitisTarihi!.toIso8601String()),
            sonOdemeTarihi: Value(_sonOdemeTarihi?.toIso8601String()),
          ),
        );

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dönem başarıyla güncellendi')),
        );
      }

      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Hata: $e')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.donem != null;
    final dateFormat = DateFormat('dd MMMM yyyy');

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Dönem Düzenle' : 'Yeni Dönem'),
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
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
            // Uyarı mesajı
            if (widget.donem != null && !_canEdit)
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange.shade300),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.orange.shade700),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Bu döneme ait tahakkuklar bulunduğu için dönem düzenlenemez.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
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
                        Icon(
                          Icons.event,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Dönem Bilgileri',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    TextFormField(
                      controller: _adController,
                      decoration: InputDecoration(
                        labelText: 'Dönem Adı *',
                        prefixIcon: const Icon(Icons.label),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Örn: Ocak 2025',
                      ),
                      validator: (v) =>
                          v?.isEmpty ?? true ? 'Dönem adı gerekli' : null,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

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
                        Icon(
                          Icons.calendar_month,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Tarihler',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),

                    // Başlangıç Tarihi
                    InkWell(
                      onTap: () => _selectDate(context, 'baslangic'),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Başlangıç Tarihi *',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _baslangicTarihi != null
                                        ? dateFormat.format(_baslangicTarihi!)
                                        : 'Tarih seçiniz',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: _baslangicTarihi != null
                                          ? FontWeight.w500
                                          : FontWeight.normal,
                                      color: _baslangicTarihi != null
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
                    const SizedBox(height: 16),

                    // Bitiş Tarihi
                    InkWell(
                      onTap: () => _selectDate(context, 'bitis'),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.event_available,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Bitiş Tarihi *',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _bitisTarihi != null
                                        ? dateFormat.format(_bitisTarihi!)
                                        : 'Tarih seçiniz',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: _bitisTarihi != null
                                          ? FontWeight.w500
                                          : FontWeight.normal,
                                      color: _bitisTarihi != null
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
                    const SizedBox(height: 16),

                    // Son Ödeme Tarihi
                    InkWell(
                      onTap: () => _selectDate(context, 'odem'),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.payment, color: Colors.orange.shade700),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Son Ödeme Tarihi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _sonOdemeTarihi != null
                                        ? dateFormat.format(_sonOdemeTarihi!)
                                        : 'Tarih seçiniz (isteğe bağlı)',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: _sonOdemeTarihi != null
                                          ? FontWeight.w500
                                          : FontWeight.normal,
                                      color: _sonOdemeTarihi != null
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
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
            ),
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    isEdit ? 'GÜNCELLE' : 'KAYDET',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

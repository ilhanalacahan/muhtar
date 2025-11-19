import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column;
import '../../db/app_database.dart';
import '../../providers.dart';

class AboneFormScreen extends ConsumerStatefulWidget {
  final AbonelerData? abone;

  const AboneFormScreen({super.key, this.abone});

  @override
  ConsumerState<AboneFormScreen> createState() => _AboneFormScreenState();
}

class _AboneFormScreenState extends ConsumerState<AboneFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _adController;
  late TextEditingController _soyadController;
  late TextEditingController _telController;
  late TextEditingController _aboneNoController;
  late TextEditingController _saatNoController;
  late TextEditingController _adresController;
  late TextEditingController _aciklamaController;
  late TextEditingController _ilkEndeksController;

  String _saatDurumu = 'normal';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _adController = TextEditingController(text: widget.abone?.ad ?? '');
    _soyadController = TextEditingController(text: widget.abone?.soyad ?? '');
    _telController = TextEditingController(text: widget.abone?.tel ?? '');
    _aboneNoController = TextEditingController(
      text: widget.abone?.aboneNo ?? '',
    );
    _saatNoController = TextEditingController(text: widget.abone?.saatNo ?? '');
    _adresController = TextEditingController(text: widget.abone?.adres ?? '');
    _aciklamaController = TextEditingController(
      text: widget.abone?.aciklama ?? '',
    );
    _ilkEndeksController = TextEditingController();
    _saatDurumu = widget.abone?.saatDurumu ?? 'normal';
  }

  @override
  void dispose() {
    _adController.dispose();
    _soyadController.dispose();
    _telController.dispose();
    _aboneNoController.dispose();
    _saatNoController.dispose();
    _adresController.dispose();
    _aciklamaController.dispose();
    _ilkEndeksController.dispose();
    super.dispose();
  }

  Future<void> _generateAboneNo() async {
    setState(() => _isLoading = true);
    try {
      final db = ref.read(dbProvider);
      final maxAboneNo = await db.getMaxAboneNo();
      _aboneNoController.text = (maxAboneNo + 1).toString();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final db = ref.read(dbProvider);

      if (widget.abone == null) {
        // Yeni abone - ilk endeks zorunlu
        if (_ilkEndeksController.text.isEmpty) {
          throw Exception('İlk endeks girilmelidir');
        }

        final aboneId = await db.createAboneFull(
          ad: _adController.text,
          soyad: _soyadController.text.isEmpty ? null : _soyadController.text,
          tel: _telController.text.isEmpty ? null : _telController.text,
          aboneNo: _aboneNoController.text,
          saatNo: _saatNoController.text.isEmpty
              ? null
              : _saatNoController.text,
          saatDurumu: _saatDurumu,
          adres: _adresController.text.isEmpty ? null : _adresController.text,
          aciklama: _aciklamaController.text.isEmpty
              ? null
              : _aciklamaController.text,
          ilkEndeks: double.parse(_ilkEndeksController.text),
        );

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Abone başarıyla eklendi')),
        );
      } else {
        // Güncelleme
        await db.updateAbone(
          widget.abone!.id,
          AbonelerCompanion(
            ad: Value(_adController.text),
            soyad: Value(
              _soyadController.text.isEmpty ? null : _soyadController.text,
            ),
            tel: Value(
              _telController.text.isEmpty ? null : _telController.text,
            ),
            aboneNo: Value(_aboneNoController.text),
            saatNo: Value(
              _saatNoController.text.isEmpty ? null : _saatNoController.text,
            ),
            saatDurumu: Value(_saatDurumu),
            adres: Value(
              _adresController.text.isEmpty ? null : _adresController.text,
            ),
            aciklama: Value(
              _aciklamaController.text.isEmpty
                  ? null
                  : _aciklamaController.text,
            ),
          ),
        );

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Abone başarıyla güncellendi')),
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
    final isEdit = widget.abone != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Abone Düzenle' : 'Yeni Abone'),
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
            // Temel Bilgiler Kartı
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
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Temel Bilgiler',
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
                        labelText: 'Ad *',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (v) =>
                          v?.isEmpty ?? true ? 'Ad gerekli' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _soyadController,
                      decoration: InputDecoration(
                        labelText: 'Soyad',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _telController,
                      decoration: InputDecoration(
                        labelText: 'Telefon',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Sayaç Bilgileri Kartı
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
                          Icons.speed,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Sayaç Bilgileri',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _aboneNoController,
                            decoration: InputDecoration(
                              labelText: 'Abone No *',
                              prefixIcon: const Icon(Icons.tag),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (v) =>
                                v?.isEmpty ?? true ? 'Abone no gerekli' : null,
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: _isLoading ? null : _generateAboneNo,
                          icon: const Icon(Icons.auto_awesome),
                          label: const Text('Otomatik'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _saatNoController,
                      decoration: InputDecoration(
                        labelText: 'Saat No',
                        prefixIcon: const Icon(Icons.watch_later_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _saatDurumu,
                      decoration: InputDecoration(
                        labelText: 'Saat Durumu',
                        prefixIcon: const Icon(Icons.settings),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'normal',
                          child: Text('Normal'),
                        ),
                        DropdownMenuItem(
                          value: 'ters',
                          child: Text('Ters Çalışıyor'),
                        ),
                        DropdownMenuItem(
                          value: 'ariza',
                          child: Text('Arızalı'),
                        ),
                      ],
                      onChanged: (v) => setState(() => _saatDurumu = v!),
                    ),
                    if (!isEdit) ...[
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _ilkEndeksController,
                        decoration: InputDecoration(
                          labelText: 'İlk Endeks *',
                          prefixIcon: const Icon(Icons.speed),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          helperText: 'Sayacın mevcut gösterge değeri',
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        validator: (v) =>
                            v?.isEmpty ?? true ? 'İlk endeks gerekli' : null,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Adres ve Notlar Kartı
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
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Adres ve Notlar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    TextFormField(
                      controller: _adresController,
                      decoration: InputDecoration(
                        labelText: 'Adres',
                        prefixIcon: const Icon(Icons.home),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _aciklamaController,
                      decoration: InputDecoration(
                        labelText: 'Açıklama',
                        prefixIcon: const Icon(Icons.note),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      maxLines: 3,
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

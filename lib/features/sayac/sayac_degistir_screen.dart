import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/app_database.dart';
import '../../providers.dart';

class SayacDegistirScreen extends ConsumerStatefulWidget {
  final AbonelerData abone;

  const SayacDegistirScreen({super.key, required this.abone});

  @override
  ConsumerState<SayacDegistirScreen> createState() =>
      _SayacDegistirScreenState();
}

class _SayacDegistirScreenState extends ConsumerState<SayacDegistirScreen> {
  final _formKey = GlobalKey<FormState>();
  final _eskiSonEndeksController = TextEditingController();
  final _yeniSaatNoController = TextEditingController();
  final _yeniEndeksController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _eskiSonEndeksController.dispose();
    _yeniSaatNoController.dispose();
    _yeniEndeksController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final db = ref.read(dbProvider);

      // Aktif sayacı bul
      final aktifSayac = await db.getAktifSayac(widget.abone.id);

      if (aktifSayac == null) {
        throw Exception('Aktif sayaç bulunamadı');
      }

      final eskiSonEndeks = double.parse(_eskiSonEndeksController.text);
      final yeniSaatNo = _yeniSaatNoController.text;
      final yeniEndeks = double.parse(_yeniEndeksController.text);

      await db.changeMeter(
        aboneId: widget.abone.id,
        eskiSayacId: aktifSayac.id,
        eskiSayacSonEndeks: eskiSonEndeks,
        yeniSaatNo: yeniSaatNo,
        yeniSayacEndeks: yeniEndeks,
      );

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sayaç değişimi başarıyla tamamlandı'),
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
        title: const Text('Sayaç Değiştir'),
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
                              'Mevcut Sayaç: ${widget.abone.saatNo}',
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

            // Eski sayaç son endeks
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
                        Icon(Icons.speed, color: Colors.orange.shade700),
                        const SizedBox(width: 8),
                        const Text(
                          'Eski Sayaç',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    TextFormField(
                      controller: _eskiSonEndeksController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Son Endeks *',
                        hintText: 'Eski sayacın son endeksi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.water_drop),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Son endeks giriniz';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Geçerli sayı giriniz';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Yeni sayaç bilgileri
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
                        Icon(Icons.fiber_new, color: Colors.green.shade700),
                        const SizedBox(width: 8),
                        const Text(
                          'Yeni Sayaç',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    TextFormField(
                      controller: _yeniSaatNoController,
                      decoration: InputDecoration(
                        labelText: 'Yeni Sayaç Numarası *',
                        hintText: 'Yeni sayaç numarası',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.numbers),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sayaç numarası giriniz';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _yeniEndeksController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Yeni Sayaç İlk Endeks *',
                        hintText: 'Yeni sayacın ilk endeksi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.water_drop),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'İlk endeks giriniz';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Geçerli sayı giriniz';
                        }
                        return null;
                      },
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
                    'DEĞİŞTİR',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}

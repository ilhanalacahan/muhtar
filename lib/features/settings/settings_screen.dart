import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column;
import '../../db/app_database.dart';
import '../../providers.dart';
import '../../services/backup_service.dart';
import '../../services/printer_service.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _backupService = BackupService();
  final _printerService = PrinterService();
  AyarlarData? _settings;
  bool _loading = true;
  bool _scanningPrinters = false;

  final _kullaniciAdiCtrl = TextEditingController();
  final _sifreCtrl = TextEditingController();
  final _kullaniciTelCtrl = TextEditingController();
  final _suM3FiyatCtrl = TextEditingController();
  final _antetBaslikCtrl = TextEditingController();
  final _antetAdresCtrl = TextEditingController();
  final _altBilgiCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final db = ref.read(dbProvider);
    final settings = await db.getSettings();
    if (settings != null && mounted) {
      setState(() {
        _settings = settings;
        _kullaniciAdiCtrl.text = settings.kullaniciAdi ?? '';
        _sifreCtrl.text = settings.sifre ?? '';
        _kullaniciTelCtrl.text = settings.kullaniciTel ?? '';
        _suM3FiyatCtrl.text = settings.suM3Fiyat.toString();
        _antetBaslikCtrl.text = settings.antetBaslik ?? '';
        _antetAdresCtrl.text = settings.antetAdres ?? '';
        _altBilgiCtrl.text = settings.altBilgi ?? '';
        _loading = false;
      });
    }
  }

  Future<void> _saveSettings() async {
    final db = ref.read(dbProvider);
    await db.updateSettings(
      AyarlarCompanion(
        kullaniciAdi: Value(_kullaniciAdiCtrl.text.trim()),
        sifre: Value(_sifreCtrl.text.trim()),
        kullaniciTel: Value(_kullaniciTelCtrl.text.trim()),
        suM3Fiyat: Value(double.tryParse(_suM3FiyatCtrl.text) ?? 0.0),
        antetBaslik: Value(_antetBaslikCtrl.text.trim()),
        antetAdres: Value(_antetAdresCtrl.text.trim()),
        altBilgi: Value(_altBilgiCtrl.text.trim()),
      ),
    );
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Ayarlar kaydedildi')));
    }
  }

  Future<void> _exportBackup() async {
    try {
      await _backupService.shareBackup();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Yedek paylaşıldı')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Hata: $e')));
      }
    }
  }

  Future<void> _scanPrinters() async {
    setState(() => _scanningPrinters = true);

    try {
      // Eşleştirilmiş cihazları al
      final devices = await _printerService.getDevices();

      if (!mounted) return;

      setState(() => _scanningPrinters = false);

      if (devices.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Eşleştirilmiş yazıcı bulunamadı. Telefon ayarlarından yazıcıyı eşleştirin.',
            ),
          ),
        );
        return;
      }

      final selected = await showDialog<BluetoothDevice>(
        context: context,
        builder: (c) => AlertDialog(
          title: const Text('Yazıcı Seç'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: devices
                  .map(
                    (d) => ListTile(
                      title: Text(d.name ?? 'Bilinmeyen'),
                      subtitle: Text(d.address),
                      onTap: () => Navigator.pop(c, d),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );

      if (selected != null && mounted) {
        // Yazıcıya bağlan
        final connected = await _printerService.connect(selected);

        if (connected) {
          final db = ref.read(dbProvider);
          await db.updateSettings(
            AyarlarCompanion(
              yaziciBluetoothAd: Value(selected.name ?? ''),
              yaziciBluetoothMac: Value(selected.address),
            ),
          );

          await _loadSettings();

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Yazıcı bağlandı: ${selected.name}')),
            );
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Yazıcıya bağlanılamadı')),
            );
          }
        }
      }
    } catch (e) {
      setState(() => _scanningPrinters = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Hata: $e')));
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Ayarlar')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveSettings,
            tooltip: 'Kaydet',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Kullanıcı Bilgileri Kartı
          _buildSectionCard(
            title: 'Kullanıcı Bilgileri',
            icon: Icons.person,
            color: const Color(0xFF0F4C81),
            children: [
              _buildTextField(
                controller: _kullaniciAdiCtrl,
                label: 'Kullanıcı Adı',
                icon: Icons.account_circle,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _sifreCtrl,
                label: 'Şifre',
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _kullaniciTelCtrl,
                label: 'Telefon',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Su Fiyatı Kartı
          _buildSectionCard(
            title: 'Su Fiyatı',
            icon: Icons.attach_money,
            color: const Color(0xFF2E7D32),
            children: [
              _buildTextField(
                controller: _suM3FiyatCtrl,
                label: 'Birim Fiyat (TL/m³)',
                icon: Icons.water_drop,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                suffix: const Text(
                  '₺/m³',
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Antet Bilgileri Kartı
          _buildSectionCard(
            title: 'Antet Bilgileri',
            icon: Icons.receipt_long,
            color: Colors.orange,
            children: [
              _buildTextField(
                controller: _antetBaslikCtrl,
                label: 'Başlık',
                icon: Icons.title,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _antetAdresCtrl,
                label: 'Adres',
                icon: Icons.location_on,
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _altBilgiCtrl,
                label: 'Alt Bilgi',
                icon: Icons.note,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Yazıcı Kartı
          _buildSectionCard(
            title: 'Bluetooth Yazıcı',
            icon: Icons.print,
            color: Colors.purple,
            children: [
              InkWell(
                onTap: _scanningPrinters ? null : _scanPrinters,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _printerService.isConnected()
                              ? Colors.green.withOpacity(0.1)
                              : Colors.grey.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.bluetooth,
                          color: _printerService.isConnected()
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _printerService.isConnected()
                                  ? 'Bağlı'
                                  : 'Yazıcı seçilmemiş',
                              style: TextStyle(
                                fontSize: 12,
                                color: _printerService.isConnected()
                                    ? Colors.green
                                    : Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _settings?.yaziciBluetoothAd ??
                                  'Yazıcı bağlamak için tıklayın',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (_settings?.yaziciBluetoothMac != null)
                              Text(
                                _settings!.yaziciBluetoothMac!,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (_scanningPrinters)
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      else
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Yedekleme Kartı
          _buildSectionCard(
            title: 'Yedekleme',
            icon: Icons.backup,
            color: Colors.teal,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.teal.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.teal.shade700,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Veritabanınızı düzenli olarak yedekleyin',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.teal.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.share),
                        label: const Text('Yedeği Paylaş'),
                        onPressed: _exportBackup,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
    int maxLines = 1,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        suffix: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF0F4C81), width: 2),
        ),
      ),
    );
  }
}

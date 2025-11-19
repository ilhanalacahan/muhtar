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
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _saveSettings),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Kullanıcı Bilgileri',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _kullaniciAdiCtrl,
            decoration: const InputDecoration(
              labelText: 'Kullanıcı Adı',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _sifreCtrl,
            decoration: const InputDecoration(
              labelText: 'Şifre',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _kullaniciTelCtrl,
            decoration: const InputDecoration(
              labelText: 'Telefon',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Su Fiyatı',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _suM3FiyatCtrl,
            decoration: const InputDecoration(
              labelText: 'Birim Fiyat (TL/m³)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          const Text(
            'Antet Bilgileri',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _antetBaslikCtrl,
            decoration: const InputDecoration(
              labelText: 'Başlık',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _antetAdresCtrl,
            decoration: const InputDecoration(
              labelText: 'Adres',
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _altBilgiCtrl,
            decoration: const InputDecoration(
              labelText: 'Alt Bilgi',
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 24),
          const Text(
            'Yazıcı',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: Colors.grey.shade100,
            title: Text(
              _printerService.isConnected()
                  ? '${_settings?.yaziciBluetoothAd ?? 'Yazıcı'} (Bağlı)'
                  : _settings?.yaziciBluetoothAd ?? 'Yazıcı seçilmemiş',
            ),
            subtitle: Text(_settings?.yaziciBluetoothMac ?? ''),
            trailing: _scanningPrinters
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.bluetooth),
            onTap: _scanningPrinters ? null : _scanPrinters,
          ),
          const SizedBox(height: 24),
          const Text(
            'Yedekleme',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            icon: const Icon(Icons.share),
            label: const Text('Yedeği Paylaş'),
            onPressed: _exportBackup,
          ),
        ],
      ),
    );
  }
}

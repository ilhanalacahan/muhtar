import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import '../services/printer_service.dart';

// Yazıcı bağlantı durumu provider'ı
final printerConnectionProvider =
    StateNotifierProvider<PrinterConnectionNotifier, bool>((ref) {
      return PrinterConnectionNotifier();
    });

class PrinterConnectionNotifier extends StateNotifier<bool> {
  final PrinterService _printerService = PrinterService();

  PrinterConnectionNotifier() : super(false) {
    _checkConnection();
  }

  void _checkConnection() {
    state = _printerService.isConnected();
  }

  void updateStatus(bool connected) {
    state = connected;
  }

  void refresh() {
    _checkConnection();
  }
}

// AppBar'da kullanılacak yazıcı durumu widget'ı
class PrinterStatusIcon extends ConsumerWidget {
  const PrinterStatusIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(printerConnectionProvider);

    return IconButton(
      icon: Stack(
        children: [
          Icon(
            Icons.bluetooth,
            color: isConnected
                ? const Color.fromARGB(255, 32, 196, 26)
                : const Color.fromARGB(179, 190, 39, 39),
          ),
          if (isConnected)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      tooltip: isConnected ? 'Yazıcı bağlı' : 'Yazıcı bağlı değil',
      onPressed: () {
        _showPrinterDialog(context, ref);
      },
    );
  }

  void _showPrinterDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => PrinterConnectionDialog(),
    );
  }
}

// Yazıcı bağlantı dialog'u
class PrinterConnectionDialog extends ConsumerStatefulWidget {
  const PrinterConnectionDialog({super.key});

  @override
  ConsumerState<PrinterConnectionDialog> createState() =>
      _PrinterConnectionDialogState();
}

class _PrinterConnectionDialogState
    extends ConsumerState<PrinterConnectionDialog> {
  final PrinterService _printerService = PrinterService();
  List<BluetoothDevice> _devices = [];
  bool _isLoading = false;
  BluetoothDevice? _selectedDevice;

  @override
  void initState() {
    super.initState();
    _loadDevices();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadDevices() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final devices = await _printerService.getDevices();
      setState(() {
        _devices = devices;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Cihazlar alınamadı: $e')));
      }
    }
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    setState(() {
      _selectedDevice = device;
    });

    try {
      final result = await _printerService.connect(device);

      if (result) {
        ref.read(printerConnectionProvider.notifier).updateStatus(true);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Yazıcı başarıyla bağlandı'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Yazıcıya bağlanılamadı'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bağlantı hatası: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _selectedDevice = null;
        });
      }
    }
  }

  Future<void> _disconnect() async {
    try {
      await _printerService.disconnect();
      ref.read(printerConnectionProvider.notifier).updateStatus(false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Yazıcı bağlantısı kesildi'),
            backgroundColor: Colors.orange,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bağlantı kesilemedi: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(printerConnectionProvider);

    return AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.bluetooth,
            color: isConnected ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 8),
          const Text('Yazıcı Bağlantısı'),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Durum kartı
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isConnected
                    ? Colors.green.shade50
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isConnected
                      ? Colors.green.shade200
                      : Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    isConnected ? Icons.check_circle : Icons.info_outline,
                    color: isConnected ? Colors.green : Colors.grey,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      isConnected ? 'Yazıcı bağlı' : 'Yazıcı bağlı değil',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isConnected
                            ? Colors.green.shade700
                            : Colors.grey.shade700,
                      ),
                    ),
                  ),
                  if (isConnected)
                    TextButton(
                      onPressed: _disconnect,
                      child: const Text('Bağlantıyı Kes'),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Bluetooth yazıcılar başlığı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bluetooth Yazıcılar',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _isLoading ? null : _loadDevices,
                ),
              ],
            ),

            const Divider(),

            // Cihaz listesi
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(),
              )
            else if (_devices.isEmpty)
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.bluetooth_disabled,
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Eşleştirilmiş yazıcı bulunamadı',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Bluetooth ayarlarından yazıcıyı eşleştirin',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _devices.length,
                  itemBuilder: (context, index) {
                    final device = _devices[index];
                    final isConnecting = _selectedDevice == device;

                    return ListTile(
                      leading: const Icon(Icons.print),
                      title: Text(device.name ?? 'Bilinmeyen'),
                      subtitle: Text(device.address),
                      trailing: isConnecting
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : ElevatedButton(
                              onPressed: _selectedDevice != null
                                  ? null
                                  : () => _connectToDevice(device),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0F4C81),
                              ),
                              child: const Text('Bağlan'),
                            ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Kapat'),
        ),
      ],
    );
  }
}

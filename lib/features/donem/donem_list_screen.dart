import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers.dart';
import 'donem_form_screen.dart';

final donemlerProvider = FutureProvider.autoDispose((ref) async {
  final db = ref.read(dbProvider);
  return db.getDonemler();
});

class DonemListScreen extends ConsumerWidget {
  const DonemListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donemlerAsync = ref.watch(donemlerProvider);
    final db = ref.read(dbProvider);
    final dateFormat = DateFormat('dd MMM yyyy');

    return Scaffold(
      appBar: AppBar(title: const Text('Dönemler')),
      body: donemlerAsync.when(
        data: (list) => list.isEmpty
            ? const Center(child: Text('Henüz dönem eklenmemiş'))
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: list.length,
                itemBuilder: (c, i) {
                  final d = list[i];
                  final baslangic = DateTime.tryParse(d.baslangicTarihi);
                  final bitis = DateTime.tryParse(d.bitisTarihi);

                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.calendar_month,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      title: Text(
                        d.ad,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.date_range,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                baslangic != null && bitis != null
                                    ? '${dateFormat.format(baslangic)} - ${dateFormat.format(bitis)}'
                                    : '${d.baslangicTarihi} - ${d.bitisTarihi}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          if (d.sonOdemeTarihi != null) ...[
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(
                                  Icons.payment,
                                  size: 14,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Son ödeme: ${DateTime.tryParse(d.sonOdemeTarihi!) != null ? dateFormat.format(DateTime.parse(d.sonOdemeTarihi!)) : d.sonOdemeTarihi}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DonemFormScreen(donem: d),
                                ),
                              );
                              if (result == true) {
                                ref.invalidate(donemlerProvider);
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (c) => AlertDialog(
                                  title: const Text('Dönem Sil'),
                                  content: Text(
                                    '${d.ad} dönemini silmek istediğinize emin misiniz?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(c, false),
                                      child: const Text('İptal'),
                                    ),
                                    FilledButton(
                                      onPressed: () => Navigator.pop(c, true),
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      child: const Text('Sil'),
                                    ),
                                  ],
                                ),
                              );
                              if (confirm == true) {
                                await db.deleteDonem(d.id);
                                ref.invalidate(donemlerProvider);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Hata: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const DonemFormScreen()),
          );
          if (result == true) {
            ref.invalidate(donemlerProvider);
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Yeni Dönem'),
      ),
    );
  }
}

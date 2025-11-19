import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as p;

class BackupService {
  Future<File> exportDatabase() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(appDir.path, 'muhtar.db'));
    final backupDir = await getTemporaryDirectory();
    final backupFile = File(p.join(backupDir.path, 'muhtar_backup.db'));
    if (await dbFile.exists()) {
      await dbFile.copy(backupFile.path);
    }
    return backupFile;
  }

  Future<void> shareBackup() async {
    final file = await exportDatabase();
    await Share.shareXFiles([
      XFile(file.path),
    ], text: 'Muhtar veritabanı yedeği');
  }

  Future<void> importDatabase(String sourcePath) async {
    final appDir = await getApplicationDocumentsDirectory();
    final target = File(p.join(appDir.path, 'muhtar.db'));
    final source = File(sourcePath);
    if (!await source.exists()) throw Exception('Kaynak dosya bulunamadı');
    await source.copy(target.path);
  }
}

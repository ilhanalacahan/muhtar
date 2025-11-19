import '../db/app_database.dart';

class SettingsRepository {
  final AppDatabase db;
  SettingsRepository(this.db);
  Future<void> init() => db.ensureDefaults();
  Future<bool> authenticate(String username, String password) =>
      db.authenticate(username, password);
}

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'app_database.g.dart';

class Ayarlar extends Table {
  @override
  Set<Column> get primaryKey => {id};

  IntColumn get id => integer()
      .customConstraint('CHECK (id = 1)')
      .withDefault(const Constant(1))();
  TextColumn get kullaniciAdi => text().named('kullanici_adi').nullable()();
  TextColumn get sifre => text().nullable()();
  TextColumn get kullaniciTel => text().named('kullanici_tel').nullable()();
  RealColumn get suM3Fiyat =>
      real().named('su_m3_fiyat').withDefault(const Constant(0.0))();
  TextColumn get antetBaslik => text().named('antet_baslik').nullable()();
  TextColumn get antetAdres => text().named('antet_adres').nullable()();
  TextColumn get altBilgi => text().named('alt_bilgi').nullable()();
  TextColumn get yaziciBluetoothAd =>
      text().named('yazici_bluetooth_ad').nullable()();
  TextColumn get yaziciBluetoothMac =>
      text().named('yazici_bluetooth_mac').nullable()();
  IntColumn get varsayilanDonemId =>
      integer().named('varsayilan_donem_id').nullable()();
}

class Donemler extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ad => text()();
  TextColumn get baslangicTarihi => text().named('baslangic_tarihi')();
  TextColumn get bitisTarihi => text().named('bitis_tarihi')();
  TextColumn get sonOdemeTarihi =>
      text().named('son_odeme_tarihi').nullable()();
}

class Aboneler extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ad => text()();
  TextColumn get soyad => text().nullable()();
  TextColumn get tel => text().nullable()();
  TextColumn get aboneNo => text().named('abone_no')();
  TextColumn get saatNo => text().named('saat_no').nullable()();
  TextColumn get saatDurumu => text()
      .named('saat_durumu')
      .nullable()
      .customConstraint(
        "CHECK (saat_durumu IN ('normal', 'ters', 'arızalı') OR saat_durumu IS NULL)",
      )();
  TextColumn get adres => text().nullable()();
  TextColumn get aciklama => text().nullable()();
  IntColumn get aktif => integer().withDefault(const Constant(1))();
}

class Endeksler extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get aboneId =>
      integer().named('abone_id').references(Aboneler, #id)();
  TextColumn get tarih => text()();
  RealColumn get endeks => real()();
  TextColumn get okuyanKisi => text().named('okuyan_kisi').nullable()();
  TextColumn get fotoPath => text().named('foto_path').nullable()();
  TextColumn get aciklama => text().nullable()();
}

class Tahakkuklar extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().clientDefault(() => const Uuid().v4())();
  IntColumn get aboneId =>
      integer().named('abone_id').references(Aboneler, #id)();
  IntColumn get donemId =>
      integer().named('donem_id').references(Donemler, #id)();
  IntColumn get ilkEndeksId =>
      integer().named('ilk_endeks_id').nullable().references(Endeksler, #id)();
  IntColumn get sonEndeksId =>
      integer().named('son_endeks_id').nullable().references(Endeksler, #id)();
  RealColumn get ilkEndeks => real().named('ilk_endeks').nullable()();
  RealColumn get sonEndeks => real().named('son_endeks').nullable()();
  RealColumn get tuketimM3 => real().named('tuketim_m3').nullable()();
  RealColumn get birimFiyat => real().named('birim_fiyat')();
  RealColumn get tutar => real()();
  TextColumn get olusturmaTarihi => text().named('olusturma_tarihi')();
  TextColumn get durum => text().withDefault(const Constant('beklemede'))();
}

class Tahsilatlar extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get tahakkukId =>
      integer().named('tahakkuk_id').references(Tahakkuklar, #id)();
  TextColumn get tarih => text()();
  RealColumn get tutar => real()();
  TextColumn get odemeTipi => text().named('odeme_tipi').nullable()();
  TextColumn get aciklama => text().nullable()();
}

class Sayaclar extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get aboneId =>
      integer().named('abone_id').references(Aboneler, #id)();
  TextColumn get saatNo => text().named('saat_no')();
  RealColumn get baslangicEndeks => real().named('baslangic_endeks')();
  TextColumn get baslangicTarihi => text().named('baslangic_tarihi')();
  RealColumn get bitisEndeks => real().named('bitis_endeks').nullable()();
  TextColumn get bitisTarihi => text().named('bitis_tarihi').nullable()();
  IntColumn get aktif => integer().withDefault(const Constant(1))();
  TextColumn get aciklama => text().nullable()();
}

@DriftDatabase(
  tables: [
    Ayarlar,
    Donemler,
    Aboneler,
    Endeksler,
    Tahakkuklar,
    Tahsilatlar,
    Sayaclar,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(endeksler);
        await migrator.createTable(tahakkuklar);
        await migrator.createTable(tahsilatlar);
      }
      if (from < 3) {
        // Add uuid column to tahakkuklar using raw SQL
        await customStatement(
          'ALTER TABLE tahakkuklar ADD COLUMN uuid TEXT NOT NULL DEFAULT \"\"',
        );
        // Create sayaclar table
        await customStatement("""CREATE TABLE IF NOT EXISTS sayaclar (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            abone_id INTEGER NOT NULL REFERENCES aboneler(id),
            saat_no TEXT NOT NULL,
            baslangic_endeks REAL NOT NULL,
            baslangic_tarihi TEXT NOT NULL,
            bitis_endeks REAL,
            bitis_tarihi TEXT,
            aktif INTEGER DEFAULT 1,
            aciklama TEXT
          )""");
        // Update aboneler with CHECK constraint for saat_durumu
        await customStatement("""CREATE TABLE IF NOT EXISTS aboneler_new (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ad TEXT NOT NULL,
            soyad TEXT,
            tel TEXT,
            abone_no TEXT NOT NULL,
            saat_no TEXT,
            saat_durumu TEXT CHECK (saat_durumu IN ('normal', 'ters', 'ariza') OR saat_durumu IS NULL),
            adres TEXT,
            aciklama TEXT,
            aktif INTEGER DEFAULT 1
          )""");
        await customStatement(
          'INSERT INTO aboneler_new SELECT * FROM aboneler',
        );
        await customStatement('DROP TABLE aboneler');
        await customStatement('ALTER TABLE aboneler_new RENAME TO aboneler');
      }
    },
  );

  Future<void> ensureDefaults() async {
    final existing = await select(ayarlar).get();
    if (existing.isEmpty) {
      await into(ayarlar).insert(
        AyarlarCompanion.insert(
          kullaniciAdi: const Value('muhtar'),
          sifre: const Value('muhtar'),
        ),
      );
    }
  }

  Future<bool> authenticate(String username, String password) async {
    final row = await (select(ayarlar)..limit(1)).getSingleOrNull();
    if (row == null) return false;
    return (row.kullaniciAdi ?? '') == username &&
        (row.sifre ?? '') == password;
  }

  Future<List<AbonelerData>> getAboneler() => select(aboneler).get();

  Future<AbonelerData?> getAboneById(int id) =>
      (select(aboneler)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> getMaxAboneNo() async {
    final query = selectOnly(aboneler)..addColumns([aboneler.aboneNo]);
    final results = await query.get();
    if (results.isEmpty) return 0;

    int max = 0;
    for (final row in results) {
      final aboneNoStr = row.read(aboneler.aboneNo);
      if (aboneNoStr != null) {
        final num = int.tryParse(aboneNoStr);
        if (num != null && num > max) max = num;
      }
    }
    return max;
  }

  Future<int> createAbone({
    required String ad,
    String? soyad,
    required String aboneNo,
  }) {
    return into(aboneler).insert(
      AbonelerCompanion.insert(ad: ad, soyad: Value(soyad), aboneNo: aboneNo),
    );
  }

  Future<int> createAboneFull({
    required String ad,
    String? soyad,
    String? tel,
    required String aboneNo,
    String? saatNo,
    String? saatDurumu,
    String? adres,
    String? aciklama,
    required double ilkEndeks,
  }) async {
    return await transaction(() async {
      final aboneId = await into(aboneler).insert(
        AbonelerCompanion.insert(
          ad: ad,
          soyad: Value(soyad),
          tel: Value(tel),
          aboneNo: aboneNo,
          saatNo: Value(saatNo),
          saatDurumu: Value(saatDurumu),
          adres: Value(adres),
          aciklama: Value(aciklama),
        ),
      );

      // İlk endeks kaydı
      await into(endeksler).insert(
        EndekslerCompanion.insert(
          aboneId: aboneId,
          tarih: DateTime.now().toIso8601String(),
          endeks: ilkEndeks,
          okuyanKisi: const Value('Sistem'),
          aciklama: const Value('İlk kayıt'),
        ),
      );

      return aboneId;
    });
  }

  Future<void> updateAbone(int id, AbonelerCompanion companion) =>
      (update(aboneler)..where((t) => t.id.equals(id))).write(companion);

  // Donem methods
  Future<List<DonemlerData>> getDonemler() => select(donemler).get();

  Future<int> createDonem({
    required String ad,
    required String baslangicTarihi,
    required String bitisTarihi,
    String? sonOdemeTarihi,
  }) {
    return into(donemler).insert(
      DonemlerCompanion.insert(
        ad: ad,
        baslangicTarihi: baslangicTarihi,
        bitisTarihi: bitisTarihi,
        sonOdemeTarihi: Value(sonOdemeTarihi),
      ),
    );
  }

  Future<void> updateDonem(int id, DonemlerCompanion companion) =>
      (update(donemler)..where((t) => t.id.equals(id))).write(companion);

  Future<bool> canDeleteOrEditDonem(int donemId) async {
    final tahakkukList = await getTahakkuklarByDonem(donemId);
    return tahakkukList.isEmpty;
  }

  Future<void> deleteDonem(int id) async {
    final canDelete = await canDeleteOrEditDonem(id);
    if (!canDelete) {
      throw Exception(
        'Bu döneme ait tahakkuklar bulunduğu için dönem silinemez',
      );
    }
    await (delete(donemler)..where((t) => t.id.equals(id))).go();
  }

  // Endeks methods
  Future<List<EndekslerData>> getEndeksByAbone(int aboneId) {
    return (select(endeksler)..where((t) => t.aboneId.equals(aboneId))).get();
  }

  Future<EndekslerData?> getLastEndeks(int aboneId) async {
    final query = select(endeksler)
      ..where((t) => t.aboneId.equals(aboneId))
      ..orderBy([(t) => OrderingTerm.desc(t.tarih)])
      ..limit(1);
    return query.getSingleOrNull();
  }

  Future<int> createEndeks({
    required int aboneId,
    required String tarih,
    required double endeks,
    String? okuyanKisi,
    String? fotoPath,
    String? aciklama,
  }) {
    return into(endeksler).insert(
      EndekslerCompanion.insert(
        aboneId: aboneId,
        tarih: tarih,
        endeks: endeks,
        okuyanKisi: Value(okuyanKisi),
        fotoPath: Value(fotoPath),
        aciklama: Value(aciklama),
      ),
    );
  }

  // Tahakkuk methods
  Future<int> createTahakkuk({
    required int aboneId,
    required int donemId,
    int? ilkEndeksId,
    int? sonEndeksId,
    double? ilkEndeks,
    double? sonEndeks,
    double? tuketimM3,
    required double birimFiyat,
    required double tutar,
    required String olusturmaTarihi,
  }) {
    return into(tahakkuklar).insert(
      TahakkuklarCompanion.insert(
        aboneId: aboneId,
        donemId: donemId,
        ilkEndeksId: Value(ilkEndeksId),
        sonEndeksId: Value(sonEndeksId),
        ilkEndeks: Value(ilkEndeks),
        sonEndeks: Value(sonEndeks),
        tuketimM3: Value(tuketimM3),
        birimFiyat: birimFiyat,
        tutar: tutar,
        olusturmaTarihi: olusturmaTarihi,
      ),
    );
  }

  Future<List<TahakkuklarData>> getTahakkuklarByDonem(int donemId) {
    return (select(tahakkuklar)..where((t) => t.donemId.equals(donemId))).get();
  }

  Future<List<TahakkuklarData>> getTahakkuklarByAbone(int aboneId) {
    return (select(tahakkuklar)..where((t) => t.aboneId.equals(aboneId))).get();
  }

  Future<List<TahakkuklarData>> getTahakkukByAbone(int aboneId) {
    return getTahakkuklarByAbone(aboneId);
  }

  Future<void> updateTahakkuk(int id, TahakkuklarCompanion companion) =>
      (update(tahakkuklar)..where((t) => t.id.equals(id))).write(companion);

  // Tahsilat methods
  Future<List<TahsilatlarData>> getTahsilatByTahakkuk(int tahakkukId) {
    return (select(
      tahsilatlar,
    )..where((t) => t.tahakkukId.equals(tahakkukId))).get();
  }

  //getDonemById
  Future<DonemlerData?> getDonemById(int id) =>
      (select(donemler)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> createTahsilat({
    required int tahakkukId,
    required String tarih,
    required double tutar,
    String? odemeTipi,
    String? aciklama,
  }) {
    return into(tahsilatlar).insert(
      TahsilatlarCompanion.insert(
        tahakkukId: tahakkukId,
        tarih: tarih,
        tutar: tutar,
        odemeTipi: Value(odemeTipi),
        aciklama: Value(aciklama),
      ),
    );
  }

  Future<double> getKalanBakiye(int tahakkukId) async {
    final tahakkuk = await (select(
      tahakkuklar,
    )..where((t) => t.id.equals(tahakkukId))).getSingleOrNull();
    if (tahakkuk == null) return 0.0;

    final tahsilatList = await (select(
      tahsilatlar,
    )..where((t) => t.tahakkukId.equals(tahakkukId))).get();
    final toplamOdeme = tahsilatList.fold<double>(
      0.0,
      (sum, t) => sum + t.tutar,
    );
    return tahakkuk.tutar - toplamOdeme;
  }

  Future<Map<String, double>> getAboneBorcBilgileri(int aboneId) async {
    final tahakkukList = await (select(
      tahakkuklar,
    )..where((t) => t.aboneId.equals(aboneId))).get();

    double toplamBorc = 0.0;
    double toplamTahsilat = 0.0;

    for (final tahakkuk in tahakkukList) {
      toplamBorc += tahakkuk.tutar;

      final tahsilatList = await (select(
        tahsilatlar,
      )..where((t) => t.tahakkukId.equals(tahakkuk.id))).get();

      for (final tahsilat in tahsilatList) {
        toplamTahsilat += tahsilat.tutar;
      }
    }

    return {
      'toplam_borc': toplamBorc,
      'toplam_tahsilat': toplamTahsilat,
      'kalan': toplamBorc - toplamTahsilat,
    };
  }

  // Ayarlar methods
  Future<AyarlarData?> getSettings() =>
      (select(ayarlar)..limit(1)).getSingleOrNull();

  Future<void> updateSettings(AyarlarCompanion settings) async {
    await update(ayarlar).write(settings);
  }

  // Sayaclar methods
  Future<int> createSayac({
    required int aboneId,
    required String saatNo,
    required double baslangicEndeks,
    required String baslangicTarihi,
    String? aciklama,
  }) {
    return into(sayaclar).insert(
      SayaclarCompanion.insert(
        aboneId: aboneId,
        saatNo: saatNo,
        baslangicEndeks: baslangicEndeks,
        baslangicTarihi: baslangicTarihi,
        aciklama: Value(aciklama),
      ),
    );
  }

  Future<List<SayaclarData>> getSayaclarByAbone(int aboneId) {
    return (select(sayaclar)..where((t) => t.aboneId.equals(aboneId))).get();
  }

  Future<SayaclarData?> getAktifSayac(int aboneId) {
    return (select(sayaclar)
          ..where((t) => t.aboneId.equals(aboneId) & t.aktif.equals(1))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<void> deaktivateSayac(int sayacId, double bitisEndeks) {
    return (update(sayaclar)..where((t) => t.id.equals(sayacId))).write(
      SayaclarCompanion(
        aktif: const Value(0),
        bitisEndeks: Value(bitisEndeks),
        bitisTarihi: Value(DateTime.now().toIso8601String()),
      ),
    );
  }

  Future<void> changeMeter({
    required int aboneId,
    required int eskiSayacId,
    required double eskiSayacSonEndeks,
    required String yeniSaatNo,
    required double yeniSayacEndeks,
  }) async {
    await transaction(() async {
      // Eski sayacı deaktive et
      await deaktivateSayac(eskiSayacId, eskiSayacSonEndeks);

      // Son endeks kaydı oluştur
      await createEndeks(
        aboneId: aboneId,
        tarih: DateTime.now().toIso8601String(),
        endeks: eskiSayacSonEndeks,
        okuyanKisi: 'Sistem',
        aciklama: 'Sayaç değişimi - eski sayaç son endeks',
      );

      // Yeni sayacı oluştur
      await createSayac(
        aboneId: aboneId,
        saatNo: yeniSaatNo,
        baslangicEndeks: yeniSayacEndeks,
        baslangicTarihi: DateTime.now().toIso8601String(),
        aciklama: 'Sayaç değişimi',
      );

      // Yeni sayaç için endeks kaydı oluştur
      await createEndeks(
        aboneId: aboneId,
        tarih: DateTime.now().toIso8601String(),
        endeks: yeniSayacEndeks,
        okuyanKisi: 'Sistem',
        aciklama: 'Sayaç değişimi - yeni sayaç ilk endeks',
      );

      // Abone tablosunda sayaç bilgisini güncelle
      await updateAbone(aboneId, AbonelerCompanion(saatNo: Value(yeniSaatNo)));
    });
  }

  Future<TahakkuklarData?> getTahakkukByUuid(String uuid) {
    return (select(
      tahakkuklar,
    )..where((t) => t.uuid.equals(uuid))).getSingleOrNull();
  }
}

LazyDatabase _open() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'muhtar.db'));
    return NativeDatabase.createInBackground(file);
  });
}

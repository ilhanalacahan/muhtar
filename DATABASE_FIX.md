# Veritabanı Hata Düzeltmesi

## ✅ Düzeltilen Sorun

**Hata:** `table "ayarlar" has more than one primary key`

**Sebep:** `Ayarlar` tablosunda PRIMARY KEY iki kez tanımlanmıştı:
1. `customConstraint('PRIMARY KEY CHECK (id = 1)')`
2. Drift otomatik olarak `PRIMARY KEY ("id")` ekliyordu

**Çözüm:** 
- `customConstraint` içinden `PRIMARY KEY` kaldırıldı
- Drift'in `@override Set<Column> get primaryKey => {id};` özelliği kullanıldı

## 🔑 Varsayılan Kullanıcı Bilgileri

```
Kullanıcı Adı: muhtar
Şifre: muhtar
```

## 📱 Uygulamayı Test Etme

### İlk Kurulum
Eğer ilk kez yüklüyorsanız, uygulama otomatik olarak:
1. Veritabanını oluşturacak
2. Varsayılan ayarları (muhtar:muhtar) ekleyecek
3. Login ekranını gösterecek

### Eski Veritabanı Varsa

Eğer hata almaya devam ediyorsanız, eski veritabanını temizleyin:

**Yöntem 1: Uygulama Verilerini Temizle (Önerilen)**
```
Android Ayarlar → Uygulamalar → Muhtar → Depolama → Verileri Temizle
```

**Yöntem 2: Uygulamayı Kaldır ve Yeniden Yükle**
```
1. Uygulamayı cihazdan kaldırın
2. flutter run veya flutter build apk ile yeniden yükleyin
```

**Yöntem 3: Geliştirme Sırasında (Terminal)**
```powershell
# Uygulamayı durdurun
flutter clean

# Önbelleği temizleyin
flutter pub get

# Yeniden derleyin
flutter run
```

## 🔄 Veritabanı Şeması (Güncel)

### Schema Version: 2

**Tablolar:**
1. `ayarlar` - Tek satırlık ayarlar (id=1)
2. `donemler` - Dönem bilgileri
3. `aboneler` - Abone bilgileri
4. `endeksler` - Sayaç okumaları
5. `tahakkuklar` - Hesaplanan faturalar
6. `tahsilatlar` - Ödemeler

### Migration Geçmişi
- **v1 → v2**: `endeksler`, `tahakkuklar`, `tahsilatlar` tabloları eklendi

## 🐛 Sorun Giderme

### "table has more than one primary key" Hatası
- ✅ Düzeltildi: `app_database.dart` güncellenip `build_runner` çalıştırıldı
- Eski cihazlarda: Uygulama verisini temizleyin

### Login Yapılamıyor
- Varsayılan: `muhtar` / `muhtar`
- Veritabanı oluşturuldu mu? → `ensureDefaults()` main.dart'ta çağrılıyor

### Boş Ekran veya Crash
- Flutter DevTools'da logları kontrol edin
- `flutter run` terminalinde hata mesajlarına bakın

## 📝 Geliştirici Notları

### Database Schema Değişikliği Yapılacaksa

1. **Tabloyu `app_database.dart`'ta güncelleyin**
2. **Schema version'ı artırın:**
   ```dart
   @DriftDatabase(
     tables: [...],
     version: 3, // <- artırın
   )
   ```

3. **Migration ekleyin:**
   ```dart
   MigrationStrategy get migration => MigrationStrategy(
     onUpgrade: (migrator, from, to) async {
       if (from < 2) {
         // v1 -> v2 migrations
       }
       if (from < 3) {
         // v2 -> v3 migrations
         await migrator.addColumn(ayarlar, ayarlar.yeniKolon);
       }
     },
   );
   ```

4. **Build runner'ı çalıştırın:**
   ```powershell
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Test edin:**
   ```powershell
   flutter clean
   flutter run
   ```

### Primary Key Constraint İpuçları

❌ **YANLIŞ:**
```dart
IntColumn get id => integer()
    .customConstraint('PRIMARY KEY')();
// Drift zaten PRIMARY KEY ekliyor!
```

✅ **DOĞRU (Tek kolon):**
```dart
IntColumn get id => integer().autoIncrement()();
// Drift otomatik PRIMARY KEY ekler
```

✅ **DOĞRU (Composite veya özel constraint):**
```dart
@override
Set<Column> get primaryKey => {id};

IntColumn get id => integer()
    .customConstraint('CHECK (id = 1)')();
```

## ✨ Sonraki Adımlar

1. ✅ Uygulama çalışıyor
2. ✅ Login ekranı görünüyor
3. ⏳ `muhtar:muhtar` ile giriş yapın
4. ⏳ İlk dönem oluşturun
5. ⏳ İlk abone ekleyin
6. ⏳ Endeks girin ve tahakkuk test edin
7. ⏳ Bluetooth yazıcı bağlayıp makbuz test edin

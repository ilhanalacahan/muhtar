# copilot-instructions.md

**Proje:** Muhtar Mobil Su Takip & Tahsilat Uygulaması

**Amaç:** Muhtarların sahada su sayaçları endekslerini takip edip, döneme ait tahakkukları oluşturarak makbuz (ve gerektiğinde ihbarname) yazdırabildiği, estetik ve zarif bir Flutter mobil uygulaması geliştirmek.

> Bu dosya Copilot / GitHub Copilot veya takım geliştiricileri için açık, adım adım yönergeler, veri modelleri, UI rehberi ve uygulama mimarisi içerir. Kod üretirken bu rehberi referans al.

---

## Özet Gereksinimler (kısa)

1. **Ayarlar** tablosu: kullanıcı bilgileri, su m3 fiyatı, antet bilgileri, yazıcı ayarları vb.
2. **Login ekranı**: Uygulama açılışında kullanıcı adı ve şifre ile giriş. "Beni hatırla" özelliği olmalı. Şifre veritabanında düz metin olarak saklanabilir.
3. **Dönemler** tablosu: dönem adı, başlangıç, bitiş, son ödeme tarihi vb.
4. **Aboneler** tablosu: ad, soyad, telefon, abone no, saat no, saat durumu, açıklama vb.
5. **Tahakkuklar**: son endekse göre hesaplama yapılıp kaydedilecek.
6. **Tahsilatlar**: tahakkuk numarasına bağlı; parçalı tahsilat desteklenir, kalan bakiyeler doğru hesaplanır.
7. **Gecikme zammı** uygulanmayacak.
8. **Bluetooth termal yazıcı** ile ihbarname/makbuz yazdırma.
9. **Yedekleme ve geri yükleme**: Veritabanı yedekleme özelliği, share_plus ile yedek dosyasını paylaşma, yedekten yükleme.

---

## 1. Paket Önerileri (Flutter)

* `share_plus` — makbuz veya PDF paylaşma/posta gönderme, yedekleme dosyası paylaşımı.
* `drift` + `sqlite3_flutter_libs` — tip güvenliği, migrations ve sorgu kolaylığı için **Önerilen**.

  * Alternatif: `sqflite` (daha hafif ama migration yönetimi manuel).
* `path_provider` — dosya yolları.
* `riverpod` — state management (tercih). Alternatif: `provider`, `bloc`.
* `intl` — tarih ve para formatlama.
* `printing` ve `pdf` (dart_pdf) — PDF oluşturma ve önizleme.
* `blue_thermal_printer`, `esc_pos_bluetooth` veya `bluetooth_print` — ESC/POS destekli termal yazıcılar için.
* `flutter_secure_storage` — hassas veriler için.
* `shared_preferences` — "beni hatırla" özelliği için basit veri saklama.
* `flutter_native_splash`, `flutter_launcher_icons` — marka deneyimi.
* `freezed`, `json_serializable` — immutable modeller, serializasyon (opsiyonel ama tavsiye edilir).

---

## 2. Mimari ve Katmanlar

* **Katmanlı yapı:** UI (screens/widgets) → State (providers) → Domain (use-cases) → Data (repositories / local db).
* **Repository pattern** uygulansın: DB, yazdırma, paylaşma gibi dış bağımlılıklar repository üzerinden sarılsın.
* **Offline-first:** Tüm işlemler yerelde tamamlanır. İleride istenecekse server sync eklensin.
* **DB Migrations:** Drift veya elle yazılmış migration scriptleri zorunlu.
* **Atomic transactions:** Endeks girme + tahakkuk oluşturma tek transaction içinde olmalı.

---

## 3. Veri Modelleri ve SQL Şeması (Örnekler)

Aşağıda önerilen tablolar ve örnek `CREATE TABLE` sorguları. Drift kullanılıyorsa bu modeller `Table` sınıfları halinde tanımlanmalı.

### 3.1 `ayarlar`

* Amaç: tek satırlık uygulama ayarları (id=1). Kolon örnekleri:

  * `id INTEGER PRIMARY KEY CHECK (id = 1)`
  * `kullanici_adi TEXT`, `kullanici_tel TEXT`
  * `su_m3_fiyat REAL` — varsayılan birim fiyat
  * `antet_baslik TEXT`, `antet_adres TEXT`, `alt_bilgi TEXT`
  * `yazici_bluetooth_ad TEXT`, `yazici_bluetooth_mac TEXT` (isteğe bağlı)
  * `varsayilan_donem_id INTEGER` (FK -> dönemler)

```sql
CREATE TABLE ayarlar (
  id INTEGER PRIMARY KEY CHECK (id = 1),
  kullanici_adi TEXT,
  sifre TEXT,
  kullanici_tel TEXT,
  su_m3_fiyat REAL DEFAULT 0.0,
  antet_baslik TEXT,
  antet_adres TEXT,
  alt_bilgi TEXT,
  yazici_bluetooth_ad TEXT,
  yazici_bluetooth_mac TEXT,
  varsayilan_donem_id INTEGER
);
```

> Uygulama ilk açılışta `id=1` kaydını default değerlerle oluşturmalı. Şifre düz metin olarak saklanabilir.

### 3.2 `donemler`

* Her dönem için: adı, başlangıç, bitiş, son ödeme gibi bilgiler.

```sql
CREATE TABLE donemler (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ad TEXT NOT NULL,
  baslangic_tarihi TEXT NOT NULL,
  bitis_tarihi TEXT NOT NULL,
  son_odeme_tarihi TEXT
);
```

### 3.3 `aboneler`

```sql
CREATE TABLE aboneler (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ad TEXT NOT NULL,
  soyad TEXT,
  tel TEXT,
  abone_no TEXT UNIQUE NOT NULL,
  saat_no TEXT,
  saat_durumu TEXT, -- (normal,ters,ariza)
  adres TEXT,
  aciklama TEXT,
  aktif INTEGER DEFAULT 1
);
```

### 3.4 `endeksler`

* Sayaç okuma kayıtları: tarih, okunan değer, fotoğraf yolu opsiyonel.

```sql
CREATE TABLE endeksler (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  abone_id INTEGER NOT NULL,
  tarih TEXT NOT NULL,
  endeks REAL NOT NULL,
  okuyan_kisi TEXT,
  foto_path TEXT,
  aciklama TEXT,
  FOREIGN KEY(abone_id) REFERENCES aboneler(id)
);
```

### 3.5 `tahakkuklar`

* Tahakkuk oluşturulduktan sonra buraya yazılacak.

```sql
CREATE TABLE tahakkuklar (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  abone_id INTEGER NOT NULL,
  donem_id INTEGER NOT NULL,
  ilk_endeks    REAL,
  son_endeks REAL,
  tuketim_m3 REAL,
  birim_fiyat REAL,
  tutar REAL,
  olusturma_tarihi TEXT,
  durum TEXT DEFAULT 'beklemede',
  FOREIGN KEY(abone_id) REFERENCES aboneler(id),
  FOREIGN KEY(donem_id) REFERENCES donemler(id)
);
```

### 3.6 `tahsilatlar`

* Parçalı tahsilat desteklenir. Kalan bakiyeyi doğru hesaplamak için her tahsilat kaydı toplanır.

```sql
CREATE TABLE tahsilatlar (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  tahakkuk_id INTEGER NOT NULL,
  tarih TEXT NOT NULL,
  tutar REAL NOT NULL,
  odeme_tipi TEXT,
  aciklama TEXT,
  FOREIGN KEY(tahakkuk_id) REFERENCES tahakkuklar(id)
);
```

---

## 4. İş Akışları ve İş Kuralları

### 4.1 Endeks Girişi → Tahakkuk Oluşturma

1. Kullanıcı `abone` için yeni `endeks` girer (tarih, değer, opsiyonel foto).
2. Sistem bu abone için en son kaydedilmiş `endeks` bilgisini bulur (varsa) — **onceki_endeks**.
3. Tüketim = max(0, son_endeks - onceki_endeks) — negatif okuma girilirse kullanıcıya uyarı verilip onay istenir.
4. Birim fiyat: `ayarlar.su_m3_fiyat` veya doneme/aboneye özel fiyat politikası varsa ona göre alınır.
5. Tutar = tüketim * birim_fiyat.
6. Tahakkuk kaydı oluşturulur: `tahakkuklar` tablosuna insert. `onceki_endeks_id` ve `son_endeks_id` referanslanır.
7. Atomic transaction: endeks ve tahakkuk tek transaction içinde işlenir.

### 4.2 Tahsilat

* Tahsilat bir veya daha fazla kayıtla tahakkuka bağlanır.
* Kalan = tahakkuk.tutar - SUM(tahsilatlar.tutar).
* Durum güncelleme:

  * `tamamlandi` => kalan <= 0
  * `kismen_odendi` => 0 < kalan < tutar
  * `beklemede` => hiç tahsilat yok
* **Gecikme zammı uygulanmaz**: bu gereksinimi kod katmanında bırak; herhangi bir gecikme/faiz fonksiyonu eklenmeyecek.

### 4.3 Fazla Tahsilat

* Fazla tahsilat yapılırsa iki seçenek sunulabilir: iade kaydı oluşturma veya fazla miktarı gelecek tahakkuka devretme. Başlangıçta iade opsiyonunu ya da manuel işlem isteğini tercih et.

### 4.4 Login

* Uygulama açılışında login ekranı gösterilir.
* Kullanıcı adı ve şifre ayarlar tablosundan kontrol edilir.
* "Beni hatırla" seçeneği varsa, shared_preferences ile hatırlanır ve sonraki açılışlarda otomatik giriş yapılır.
* Şifre düz metin olarak saklanır ve karşılaştırılır.

### 4.5 Yedekleme ve Geri Yükleme

* Veritabanı dosyasını (SQLite .db) yedekle: path_provider ile uygulama dizininden kopyala, share_plus ile paylaş.
* Yedekten yükleme: Paylaşılan dosyayı al, veritabanı dizinine kopyala, uygulamayı yeniden başlat.

---

## 5. Validasyon Kuralları

* `abone_no` unique olmalı.
* Endeks doğrulama: yeni_endeks >= onceki_endeks ? (eğer değilse kullanıcıya onay gerektir).
* Telefon formatu doğrulaması (opsiyonel açıklama).
* Donem sonu kontrolü: tahakkuk `donem_id` uygun döneme ait olmalı.

---

## 6. Tasarım — Estetik & Zarif

**Prensipler:** minimal, temiz tipografi, güçlü boşluk kullanımı, yuvarlatılmış çizgiler, yumuşak gölgeler, göze yormayan nötr arka planlar.

### Renk Paleti Önerisi

* **Ana renk:** #0F4C81 (derin mavi)
* **İkincil:** #2E7D32 (doğayla uyumlu yeşil) — olumlu durumlar için
* **Nötr arka plan:** #FAFBFC
* **Kart arka plan:** #FFFFFF
* **Text primary:** #1F2937

### Tipografi

* Standart Flutter fontları yeterli — Başlıklar: 20-24pt, Metin: 14pt, Yardımcı: 12pt.

### Ekran ve Bileşen Örnekleri

* **Ana ekran:** Hızlı aksiyon kartları (Yeni Endeks, Tahakkuk Oluştur, Tahsilat), arama çubuğu, son aktiviteler.
* **Abone kartı:** avatar (ilk harf), ad soyad, abone no, saat durumu, kısa bakiye bilgisi.
* **Endeks girişi formu:** büyük, kolay okunur numeric input; foto ekleme butonu; kaydet & tahakkuk oluştur butonları.
* **Tahakkuk listesi:** donem filtreleri, bakiye simgeleri, hızlı makbuz yazdır.

### Micro-interactions

* Başarılı işlemler için küçük slide/confirm animasyonları.
* Form hata durumlarında inline uyarılar.

---

## 7. Yazıcı & İhbarname

* **Yazıcı eşleştirme ekranı:** Tarama, seçme, kaydetme (ayarlar.dosya).
* **Makbuz şablonu:** Antet, abone bilgileri, önceki/son endeks, tüketim, birim fiyat, tutar, tahsilat toplamı, kalan.
* **İhbarname:** Termal yazıcı uzun metinleri gösteremezse; kısa ihbar özetie basılmalı (ödeme talebi, son ödeme tarihi, bakiye). İstenirse PDF olarak tam ihbarname oluşturup paylaş veya mail gönder.
* **Türkçe karakterler:** ESC/POS kullanan yazıcılarda charset sorunları olabilir — yazıcıya göre transliteration veya UTF-8 destek kontrolü yapılmalı.

---

## 8. Kullanıcı Akışı Örnekleri (Senaryolar)

1. **Login:** Uygulama açılışında kullanıcı adı ve şifre girilir. "Beni hatırla" seçilirse sonraki açılışlarda otomatik giriş.
2. **Endeks girme (tek abone):** Abone seç → Endeks gir → Foto ekle (opsiyonel) → Kaydet ve Tahakkuk Oluştur.
3. **Toplu endeks girişi:** CSV import veya manuel hızlı giriş modu — sunucu sync yoksa lokal işlem.
4. **Tahsilat:** Tahakkuk seç → Tutar gir → Parçalı tahsilat desteklenir → Makbuz yazdır/Paylaş.
5. **İhbarname yazdırma:** Tahakkuk> kalan > ihbarname butonu → kısa termal çıktı veya detaylı PDF.
6. **Yedekleme:** Ayarlar ekranından yedekleme butonu → Veritabanı dosyası oluşturulur → Share_plus ile paylaşılır.
7. **Geri yükleme:** Ayarlar ekranından geri yükleme butonu → Dosya seçilir → Veritabanı geri yüklenir.

---

## 9. Test Senaryoları

* Unit test: tahakkuk hesaplama, bakiye hesaplama.
* Integration: DB migration, import/export .db.
* Manual: Bluetooth pair & print testleri farklı yazıcı modellerinde.

---

## 10. Geliştirme Yol Haritası (Sprint önerisi)

* **Sprint 1 (1 hafta):** Proje scaffold, DB modeller (ayarlar, donemler, aboneler), abone CRUD, ayarlar ekranı, login ekranı ve "beni hatırla" özelliği.
* **Sprint 2 (1 hafta):** Endeks tablosu & endeks girişi, önceki endeks doğrulama, tahakkuk hesaplama (basit).
* **Sprint 3 (1 hafta):** Tahakkuklar listeleme, tahsilat (parçalı) kaydı, bakiye hesaplama.
* **Sprint 4 (1 hafta):** Bluetooth yazdırma entegrasyonu, makbuz/ihbarname şablonları, PDF export.
* **Sprint 5 (1 hafta):** UI iyileştirmeleri, testler, export/import, yedekleme ve geri yükleme, sürüm hazırlığı.

---

## 11. Copilot için Notlar (Kod üretim rehberi)

* Kod dili: **İngilizce** (fonksiyon/variable isimleri), UI/label: **Türkçe**. Bu konvansiyonu proje başında sabitle.
* Fonksiyon örnekleri: `createReceipt`, `calculateBill`, `recordPayment`, `printWarning`.
* Migrationları her değişiklikte oluştur. Copilot taleplerinde "include a Drift migration for X" gibi açık istekte bulun.

---

## 12. Ek Opsiyonel Özellikler (ileriki sürümler)

* Sunucu sync ve merkezi yedekleme.
* CSV import/export (endeksler ve aboneler için).
* Barkod/QR ile abone hızlı tarama (abone kartına QR basılacaksa).

---

## 13. Yaygın Hata & Çözüm Önerileri

* **Endeks negatif veya düşüş:** Kullanıcıya doğrulama isteği çık, yanlış giriş varsa düzeltme opsiyonu.
* **Bluetooth eşleme sıkıntıları:** Android location izinleri, runtime permission hatırlatma.
* **Türkçe karakter bozulması:** Yazıcı charset problemi — ESC/POS transliteration veya uygun codepage seç.

---

## 14. Son Not

Bu dosya projenin birincil rehberi olacak şekilde tasarlandı. İstersen kademeli fiyatlama (tarife basamakları), Drift örnek migration dosyaları, örnek PDF şablonları veya ESC/POS komutları ekleyebilirim. Ayrıca uygulama içinde kullanılmak üzere görsel UI mockup'ları/örnek Figma paletleri hazırlamamı istersen söyle.

*Doküman güncel tutulmalı — değişiklik yapıldıkça Copilot için örnek kod blokları ve migration örnekleri eklenmelidir.*

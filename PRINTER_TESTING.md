# Yazıcı Test Rehberi

## Değişiklikler Özeti

### Eski Paket (Kaldırıldı)
- `blue_thermal_printer: ^1.2.3` → Android Gradle Plugin 8.0+ ile uyumsuz namespace hatası

### Yeni Paketler (Eklendi)
- `print_bluetooth_thermal: ^1.1.7` → Modern Bluetooth termal yazıcı desteği
- `esc_pos_utils_plus: ^2.0.1` → ESC/POS komut üretimi

## API Değişiklikleri

### 1. PrinterService.getDevices()
```dart
// ESKİ
Future<List<BluetoothDevice>> getDevices()
  devices[0].name      // String?
  devices[0].address   // String?

// YENİ
Future<List<BluetoothInfo>> getDevices()
  devices[0].name      // String
  devices[0].macAdress // String (dikkat: "macAdress" yazımı)
```

### 2. PrinterService.connect()
```dart
// ESKİ
await printerService.connect(device)  // BluetoothDevice nesnesi

// YENİ
await printerService.connect(macAddress)  // String MAC adresi
```

### 3. Makbuz/İhbarname Yazdırma
- API aynı kaldı: `printMakbuz()` ve `printIhbarname()` methodları değişmedi
- Ancak arka planda ESC/POS komutları esc_pos_utils_plus ile üretiliyor
- Termal yazıcı genişliği: 58mm (PaperSize.mm58)

## Test Adımları

### Adım 1: Bluetooth İzinlerini Doğrulama
```
Android 12+ için AndroidManifest.xml zaten güncellenmiş durumda:
- BLUETOOTH_SCAN
- BLUETOOTH_CONNECT
- BLUETOOTH_ADVERTISE
```

### Adım 2: Ayarlar Ekranında Yazıcı Eşleştirme
1. Ana ekrandan drawer'ı açın
2. "Ayarlar"a gidin
3. "Yazıcı Seç" butonuna tıklayın
4. Android Bluetooth ayarlarından daha önce eşleştirilmiş yazıcılar listelenecek
5. Yazıcınızı seçin
6. `yazici_bluetooth_ad` ve `yazici_bluetooth_mac` veritabanına kaydedilecek

### Adım 3: Makbuz Yazdırma Testi
1. Ana ekranda bir abone seçin
2. Endeks girin ve tahakkuk oluşturun
3. Tahakkuk listesinde tahakkuka tıklayın
4. "Tahsilat Yap" butonuna basın ve ödeme kaydedin
5. "Makbuz Yazdır" butonuna tıklayın
6. Yazıcı bağlı değilse uyarı gösterecek
7. Bağlıysa makbuz yazdırılacak

### Adım 4: İhbarname Yazdırma Testi
```dart
// printer_service.dart'ta printIhbarname() methodu hazır
// Ancak UI'da henüz ihbarname butonu eklenmedi
// İhtiyaç halinde tahakkuk_list_screen.dart'a eklenebilir
```

## Yazıcı Bağlantı Kontrolü

Eğer yazıcı bağlanmazsa:

### 1. Android Bluetooth Ayarlarından Kontrol
- Ayarlar → Bluetooth → Yazıcı eşleştirilmiş mi?
- Eşleştirilmemişse manuel olarak eşleştirin

### 2. Konum İzni (Android 12+)
- Bluetooth scanning için konum izni gerekli
- permission_handler paketi zaten eklendi
- Runtime permission istemek için:
```dart
await Permission.bluetoothScan.request();
await Permission.bluetoothConnect.request();
```

### 3. Yazıcı Test Kodu
```dart
final printerService = PrinterService();
final devices = await printerService.getDevices();
print('Bulunan yazıcılar: ${devices.length}');
for (var device in devices) {
  print('Ad: ${device.name}, MAC: ${device.macAdress}');
}

if (devices.isNotEmpty) {
  final connected = await printerService.connect(devices[0].macAdress);
  print('Bağlantı durumu: $connected');
}
```

## Türkçe Karakter Desteği

ESC/POS yazıcılar Türkçe karakterleri doğru göstermeyebilir:
- Çözüm 1: Yazıcı codepage ayarı (CP857 Türkçe)
- Çözüm 2: Transliteration (ş→s, ğ→g, ç→c vb.)

Şu anda transliteration uygulanmadı. Gerekirse `printer_service.dart`'ta eklenebilir:
```dart
String _removeTurkishChars(String text) {
  return text
      .replaceAll('ş', 's')
      .replaceAll('Ş', 'S')
      .replaceAll('ğ', 'g')
      .replaceAll('Ğ', 'G')
      .replaceAll('ç', 'c')
      .replaceAll('Ç', 'C')
      .replaceAll('ı', 'i')
      .replaceAll('İ', 'I')
      .replaceAll('ö', 'o')
      .replaceAll('Ö', 'O')
      .replaceAll('ü', 'u')
      .replaceAll('Ü', 'U');
}
```

## Bilinen Sorunlar ve Çözümler

### Hata: "Namespace not specified"
- Çözüldü: print_bluetooth_thermal kullanıyoruz (AGP 8.0+ uyumlu)

### Hata: "PosStyles isn't a class"
- Çözüldü: esc_pos_utils_plus paketi eklendi

### Hata: "Yazıcı bağlı değil"
- Bluetooth yazıcının açık ve eşleştirilmiş olduğundan emin olun
- Settings ekranından yazıcı seçimini tekrar yapın
- `await printerService.connect(macAddress)` çağrısı yapılmış olmalı

## Sonraki Adımlar

1. ✅ Paket değişikliği tamamlandı
2. ✅ flutter pub get çalıştırıldı
3. ✅ flutter analyze temiz geçti
4. ⏳ Gerçek cihazda test edilmeli
5. ⏳ Türkçe karakter sorunları gözlemlenip düzeltilmeli
6. ⏳ İhbarname butonu UI'a eklenebilir
7. ⏳ PDF export özelliği (isteğe bağlı)

## Ek Notlar

- Yazıcı bağlantısı her print işleminden önce kontrol edilmeli
- `isConnected()` her zaman güncel durumu döndürmeyebilir, print öncesi `connect()` çağrısı güvenlidir
- Uzun metinler için 58mm yazıcı sınırlıdır, satır başına ~32 karakter sığar
- Makbuz kesme (cut) işlemi yazıcı destekliyorsa çalışır

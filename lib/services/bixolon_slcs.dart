import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

class BixolonSlcsGenerator {
  final StringBuffer _contentBuffer = StringBuffer();
  int _currentY = 30;
  final int _pageWidth;

  // Türkçe karakter dönüştürme haritası
  static const Map<String, int> _trCharMap = {
    'Ğ': 208,
    'ğ': 240,
    'Ü': 220,
    'ü': 252,
    'ş': 254,
    'Ş': 222,
    'ı': 253,
    'İ': 221,
    'ö': 246,
    'Ö': 214,
    'ç': 231,
    'Ç': 199,
    'â': 226,
    'Â': 194,
  };

  BixolonSlcsGenerator({int pageWidthDots = 550}) : _pageWidth = pageWidthDots;

  /// Metin ekleme
  void addText(
    String text, {
    int fontType = 2,
    bool bold = false,
    String align = 'L', // L, C, R
  }) {
    final boldCmd = bold ? 'B' : 'N';

    // X koordinatı hesaplama
    int x = 10;
    if (align == 'R') {
      x = _pageWidth - (text.length * _getFontWidth(fontType)) - 10;
    } else if (align == 'C') {
      final textWidth = text.length * _getFontWidth(fontType);
      x = (_pageWidth - textWidth) ~/ 2;
      if (x < 0) x = 0;
    }

    // T komutu (Text)
    _contentBuffer.write(
      "T$x,$_currentY,$fontType,1,1,0,$boldCmd,N,N,'$text'\r\n",
    );
    _currentY += _getFontHeight(fontType) + 10;
  }

  /// Belirli bir X koordinatına metin ekleme (satır sonu yok)
  void addTextAt(int x, String text, {int fontType = 2, bool bold = false}) {
    final boldCmd = bold ? 'B' : 'N';
    _contentBuffer.write(
      "T$x,$_currentY,$fontType,1,1,0,$boldCmd,N,N,'$text'\r\n",
    );
  }

  /// Yeni satıra geç
  void newLine({int fontType = 2}) {
    _currentY += _getFontHeight(fontType) + 10;
  }

  /// Yatay çizgi çiz
  void drawLine() {
    const lineHeight = 2;
    _contentBuffer.write(
      "BD0,$_currentY,$_pageWidth,${_currentY + lineHeight},1\r\n",
    );
    _currentY += lineHeight + 10;
  }

  /// Boşluk ekle
  void addFeed(int dots) {
    _currentY += dots;
  }

  /// Barkod ekle
  void addBarcode(String data) {
    const height = 60;
    int x = (_pageWidth - (data.length * 24)) ~/ 2;
    if (x < 0) x = 0;

    _contentBuffer.write("B1$x,$_currentY,0,2,6,$height,0,1,'$data'\r\n");
    _currentY += height + 40;
  }

  /// QR kod ekle
  void addQRCode(String data) {
    // QR ayarları (senin tercihine göre değiştirebilirsin)
    const qrType = 'Q'; // QR Code
    const model = 2; // Model 2 (daha fazla kapasite)
    const eccLevel = 'M'; // M = %15 hata düzeltme (tavsiye edilir)
    const moduleSize =
        5; // 1-4 arası, 4 veya 5 en okunaklı olur (5 bazı modellerde çalışır, yoksa 4 yap)
    const rotation = 0;

    // 1) QR'ın tahmini modül sayısını (versiyon) hesapla
    int estimatedVersion = _estimateQrVersion(data, eccLevel);

    // 2) Her versiyonun modül sayısı: 21 + (version-1)*4
    int moduleCount = 21 + (estimatedVersion - 1) * 4;

    // 3) Toplam QR boyutu (dot) = modül sayısı × moduleSize
    // +8 dot quiet zone (her tarafta 4 modül × moduleSize)
    int qrSizeDots =
        moduleCount * moduleSize + 8; // 8 = 4 modül quiet zone × 2 (sağ+sol)

    // 4) Yatayda tam ortaya almak için X koordinatı
    int xPosition = (_pageWidth - qrSizeDots) ~/ 2;

    // Güvenlik: X negatif olmasın (çok büyük QR olursa)
    if (xPosition < 0) xPosition = 0;

    // 5) Komutu yaz
    _contentBuffer.write(
      "B2$xPosition,$_currentY,$qrType,$model,$eccLevel,$moduleSize,$rotation,'$data'\r\n",
    );

    // 6) Bir sonraki eleman için Y'yi QR boyutu + biraz boşluk kadar artır
    _currentY += qrSizeDots + 50; // 50 dot ekstra boşluk (isteğe bağlı)
  }

  /// QR versiyonunu veri uzunluğuna göre yaklaşık olarak tahmin eder
  /// (Model 2, verilen ECC seviyesi için)
  int _estimateQrVersion(String data, String ecc) {
    int length = data.length;

    // Alphanumeric modda yaklaşık kapasite (en kötümser tahmin için byte mod kullandık)
    // Model 2 kapasiteleri (byte mode):
    Map<String, List<int>> capacityTable = {
      'L': [0, 41, 77, 127, 187, 255, 322, 370, 461, 552, 652], // versiyon 1-10
      'M': [0, 34, 63, 101, 149, 202, 255, 293, 365, 432, 513],
      'Q': [0, 27, 48, 77, 111, 144, 178, 207, 259, 312, 367],
      'H': [0, 17, 34, 58, 82, 106, 139, 154, 202, 235, 288],
    };

    List<int> caps = capacityTable[ecc] ?? capacityTable['M']!;

    for (int v = 1; v < caps.length; v++) {
      if (length <= caps[v]) {
        return v;
      }
    }
    // Çok büyükse max versiyon 10 kabul et (daha fazlası nadiren lazım)
    return 10;
  }

  /// Byte dizisi oluştur ve gönderime hazır hale getir
  Uint8List getBytes() {
    /**
     * Ğ -> 208
     * ğ -> 240
     * ü -> 220
    */
    final finalPacket = StringBuffer();

    // 1. Buffer temizliği
    finalPacket.write("CB\r\n");

    // 2. Ayarlar
    finalPacket.write("SW$_pageWidth\r\n"); // Genişlik
    finalPacket.write("SD15\r\n"); // Koyuluk
    finalPacket.write("CS0,12\r\n"); // Türkçe karakter seti

    // 3. Sayfa uzunluğu
    final finalHeight = _currentY + 50;
    finalPacket.write("SL$finalHeight,0,C\r\n");

    // 4. İçerik
    finalPacket.write(_contentBuffer.toString());

    // 5. Yazdır komutu
    finalPacket.write("P1\r\n");

    // Özel karakterleri byte değerleriyle değiştir
    final packetString = finalPacket.toString();
    final List<int> bytes = [];
    for (int i = 0; i < packetString.length; i++) {
      final char = packetString[i];
      final mappedByte = _trCharMap[char];
      if (mappedByte != null) {
        bytes.add(mappedByte);
      } else {
        bytes.addAll(utf8.encode(char));
      }
    }

    return Uint8List.fromList(bytes);
  }

  int _getFontHeight(int fontType) {
    switch (fontType) {
      case 0:
        return 15;
      case 1:
        return 20;
      case 2:
        return 25;
      case 3:
        return 30;
      case 4:
        return 40;
      case 5:
        return 50;
      default:
        return 24;
    }
  }

  int _getFontWidth(int fontType) {
    switch (fontType) {
      case 0:
        return 9;
      case 1:
        return 11;
      case 2:
        return 14;
      case 3:
        return 18;
      case 4:
        return 22;
      case 5:
        return 28;
      default:
        return 15;
    }
  }
}

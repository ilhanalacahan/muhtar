import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:uuid/uuid.dart';
import 'bixolon_slcs.dart';

class PrinterService {
  // Singleton pattern
  static final PrinterService _instance = PrinterService._internal();
  factory PrinterService() => _instance;
  PrinterService._internal();

  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  BluetoothDevice? _connectedDevice;
  BluetoothConnection? _connection;

  /// Eşleştirilmiş Bluetooth cihazlarını listele
  Future<List<BluetoothDevice>> getDevices() async {
    try {
      final devices = await _bluetooth.getBondedDevices();
      return devices;
    } catch (e) {
      throw Exception('Cihazlar alınamadı: $e');
    }
  }

  /// Yazıcıya bağlan
  Future<bool> connect(BluetoothDevice device) async {
    try {
      _connection = await BluetoothConnection.toAddress(device.address);
      _connectedDevice = device;
      return _connection?.isConnected ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Yazıcı bağlantısını kes
  Future<void> disconnect() async {
    try {
      await _connection?.close();
      _connection = null;
      _connectedDevice = null;
    } catch (e) {
      // Ignore
    }
  }

  /// Bağlı mı kontrol et
  bool isConnected() {
    return _connection?.isConnected ?? false;
  }

  /// Bağlı cihaz
  BluetoothDevice? get connectedDevice => _connectedDevice;

  /// Veri gönder
  Future<void> _sendData(Uint8List data) async {
    if (_connection == null || !isConnected()) {
      throw Exception('Yazıcı bağlı değil');
    }

    try {
      _connection!.output.add(data);
      await _connection!.output.allSent;
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      throw Exception('Veri gönderilemedi: $e');
    }
  }

  // -----------------------------------------------------
  //  MAKBUZ
  // -----------------------------------------------------

  Future<void> printMakbuz({
    required String antetBaslik,
    required String antetAdres,
    required String altBilgi,
    required String aboneAd,
    required String aboneNo,
    required String donem,
    required double ilkEndeks,
    required double sonEndeks,
    required double tuketim,
    required double birimFiyat,
    required double tutar,
    required double odenen,
    required double kalan,
    required String tarih,
  }) async {
    if (!isConnected()) {
      throw Exception("Yazıcı bağlı değil");
    }

    final bixolon = BixolonSlcsGenerator(pageWidthDots: 550);

    // ------------ Üst Başlık ------------
    bixolon.addText(antetBaslik, fontType: 2, bold: true, align: 'C');
    bixolon.addText(antetAdres, fontType: 1, bold: false, align: 'C');

    bixolon.addText(
      "SU TÜKETİM İHBARNAMESİ",
      fontType: 3,
      bold: true,
      align: 'C',
    );
    bixolon.addFeed(20);

    // ------------ Genel Bilgiler ------------
    bixolon.addText(
      "Tarih:".padRight(20) + tarih,
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Abone:".padRight(20) + aboneAd,
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Abone No:".padRight(20) + aboneNo,
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Donem:".padRight(20) + donem,
      fontType: 1,
      bold: false,
      align: 'L',
    );

    bixolon.drawLine();

    // ------------ Endeks Bilgileri ------------
    bixolon.addText(
      "Ilk Endeks:".padRight(20) + ilkEndeks.toStringAsFixed(2),
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Son Endeks:".padRight(20) + sonEndeks.toStringAsFixed(2),
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Tuketim:".padRight(20) + tuketim.toStringAsFixed(2) + " m3",
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Birim Fiyat:".padRight(20) + birimFiyat.toStringAsFixed(2) + " TL",
      fontType: 1,
      bold: false,
      align: 'L',
    );

    bixolon.drawLine();

    // ------------ Tutar Bilgileri ------------
    bixolon.addText(
      "Toplam Tutar   : ${tutar.toStringAsFixed(2)} TL",
      fontType: 2,
      bold: true,
      align: 'L',
    );
    bixolon.addText(
      "Odenen         : ${odenen.toStringAsFixed(2)} TL",
      fontType: 2,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Kalan          : ${kalan.toStringAsFixed(2)} TL",
      fontType: 2,
      bold: true,
      align: 'L',
    );

    bixolon.addFeed(15);

    // ------------ Alt Bilgi ------------
    bixolon.addText(altBilgi, fontType: 1, bold: false, align: 'C');
    bixolon.addFeed(5);
    //bixolon.addBarcode("123456789");
    //generate uuid4
    var uid = const Uuid().v4();
    bixolon.addQRCode(uid);

    // Yazdır
    final bytes = bixolon.getBytes();
    await _sendData(bytes);
  }

  // -----------------------------------------------------
  //  İHBARNAME
  // -----------------------------------------------------

  Future<void> printIhbarname({
    required String antetBaslik,
    required String antetAdres,
    required String aboneAd,
    required String aboneNo,
    required String donem,
    required double kalan,
    required String sonOdemeTarihi,
  }) async {
    if (!isConnected()) {
      throw Exception("Yazıcı bağlı değil");
    }

    final bixolon = BixolonSlcsGenerator(pageWidthDots: 550);

    bixolon.addText(antetBaslik, fontType: 2, bold: true, align: 'C');
    bixolon.addText(antetAdres, fontType: 1, bold: false, align: 'C');
    bixolon.addFeed(10);

    bixolon.addText("IHBARNAME", fontType: 3, bold: true, align: 'C');
    bixolon.addFeed(10);

    bixolon.addText("Abone: $aboneAd", fontType: 1, bold: false, align: 'L');
    bixolon.addText("Abone No: $aboneNo", fontType: 1, bold: false, align: 'L');
    bixolon.addText("Donem: $donem", fontType: 1, bold: false, align: 'L');

    bixolon.drawLine();

    bixolon.addText(
      "Borc: ${kalan.toStringAsFixed(2)} TL",
      fontType: 2,
      bold: true,
      align: 'L',
    );
    bixolon.addText(
      "Son Odeme: $sonOdemeTarihi",
      fontType: 1,
      bold: false,
      align: 'L',
    );

    bixolon.addFeed(10);

    bixolon.addText(
      "Lutfen borcunuzu son odeme tarihine kadar yatiriniz.",
      fontType: 1,
      bold: false,
      align: 'C',
    );

    bixolon.addFeed(5);

    final bytes = bixolon.getBytes();
    await _sendData(bytes);
  }

  // -----------------------------------------------------
  //  TEST YAZDIR
  // -----------------------------------------------------

  Future<void> printTestTicket() async {
    if (!isConnected()) {
      throw Exception("Yazıcı bağlı değil");
    }

    final bixolon = BixolonSlcsGenerator(pageWidthDots: 550);

    bixolon.addText("T.C.", fontType: 2, bold: true, align: 'C');
    bixolon.addText("BASYAYLA KOYU", fontType: 2, bold: true, align: 'C');
    bixolon.addText("MUHTARLIGI", fontType: 2, bold: true, align: 'C');
    bixolon.addFeed(10);

    bixolon.addText(
      "Turkce Karakterler: ÇĞIÖŞÜ çğıöşü",
      fontType: 1,
      bold: false,
      align: 'C',
    );
    bixolon.addFeed(5);

    bixolon.addText("Bold text", fontType: 1, bold: true, align: 'L');
    bixolon.addText("Normal text", fontType: 1, bold: false, align: 'L');
    bixolon.addText("Center align", fontType: 1, bold: false, align: 'C');
    bixolon.addText("Right align", fontType: 1, bold: false, align: 'R');

    bixolon.drawLine();

    bixolon.addText(
      "Abone Adi      : Cihad GUNDOGDU",
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Kimlik No      : 62389268914",
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Ilk Endeks     : 100",
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Son Endeks     : 250",
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Tuketim        : 150 m3",
      fontType: 1,
      bold: false,
      align: 'L',
    );
    bixolon.addText(
      "Toplam Tutar   : 450.00 TL",
      fontType: 1,
      bold: false,
      align: 'L',
    );

    bixolon.drawLine();

    bixolon.addText("Test basarili!", fontType: 2, bold: true, align: 'C');
    bixolon.addFeed(5);

    final bytes = bixolon.getBytes();
    await _sendData(bytes);
  }
}

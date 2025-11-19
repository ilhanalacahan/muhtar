// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AyarlarTable extends Ayarlar with TableInfo<$AyarlarTable, AyarlarData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AyarlarTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'CHECK (id = 1)',
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _kullaniciAdiMeta = const VerificationMeta(
    'kullaniciAdi',
  );
  @override
  late final GeneratedColumn<String> kullaniciAdi = GeneratedColumn<String>(
    'kullanici_adi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sifreMeta = const VerificationMeta('sifre');
  @override
  late final GeneratedColumn<String> sifre = GeneratedColumn<String>(
    'sifre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kullaniciTelMeta = const VerificationMeta(
    'kullaniciTel',
  );
  @override
  late final GeneratedColumn<String> kullaniciTel = GeneratedColumn<String>(
    'kullanici_tel',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _suM3FiyatMeta = const VerificationMeta(
    'suM3Fiyat',
  );
  @override
  late final GeneratedColumn<double> suM3Fiyat = GeneratedColumn<double>(
    'su_m3_fiyat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _antetBaslikMeta = const VerificationMeta(
    'antetBaslik',
  );
  @override
  late final GeneratedColumn<String> antetBaslik = GeneratedColumn<String>(
    'antet_baslik',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _antetAdresMeta = const VerificationMeta(
    'antetAdres',
  );
  @override
  late final GeneratedColumn<String> antetAdres = GeneratedColumn<String>(
    'antet_adres',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _altBilgiMeta = const VerificationMeta(
    'altBilgi',
  );
  @override
  late final GeneratedColumn<String> altBilgi = GeneratedColumn<String>(
    'alt_bilgi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yaziciBluetoothAdMeta = const VerificationMeta(
    'yaziciBluetoothAd',
  );
  @override
  late final GeneratedColumn<String> yaziciBluetoothAd =
      GeneratedColumn<String>(
        'yazici_bluetooth_ad',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _yaziciBluetoothMacMeta =
      const VerificationMeta('yaziciBluetoothMac');
  @override
  late final GeneratedColumn<String> yaziciBluetoothMac =
      GeneratedColumn<String>(
        'yazici_bluetooth_mac',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _varsayilanDonemIdMeta = const VerificationMeta(
    'varsayilanDonemId',
  );
  @override
  late final GeneratedColumn<int> varsayilanDonemId = GeneratedColumn<int>(
    'varsayilan_donem_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kullaniciAdi,
    sifre,
    kullaniciTel,
    suM3Fiyat,
    antetBaslik,
    antetAdres,
    altBilgi,
    yaziciBluetoothAd,
    yaziciBluetoothMac,
    varsayilanDonemId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ayarlar';
  @override
  VerificationContext validateIntegrity(
    Insertable<AyarlarData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kullanici_adi')) {
      context.handle(
        _kullaniciAdiMeta,
        kullaniciAdi.isAcceptableOrUnknown(
          data['kullanici_adi']!,
          _kullaniciAdiMeta,
        ),
      );
    }
    if (data.containsKey('sifre')) {
      context.handle(
        _sifreMeta,
        sifre.isAcceptableOrUnknown(data['sifre']!, _sifreMeta),
      );
    }
    if (data.containsKey('kullanici_tel')) {
      context.handle(
        _kullaniciTelMeta,
        kullaniciTel.isAcceptableOrUnknown(
          data['kullanici_tel']!,
          _kullaniciTelMeta,
        ),
      );
    }
    if (data.containsKey('su_m3_fiyat')) {
      context.handle(
        _suM3FiyatMeta,
        suM3Fiyat.isAcceptableOrUnknown(data['su_m3_fiyat']!, _suM3FiyatMeta),
      );
    }
    if (data.containsKey('antet_baslik')) {
      context.handle(
        _antetBaslikMeta,
        antetBaslik.isAcceptableOrUnknown(
          data['antet_baslik']!,
          _antetBaslikMeta,
        ),
      );
    }
    if (data.containsKey('antet_adres')) {
      context.handle(
        _antetAdresMeta,
        antetAdres.isAcceptableOrUnknown(data['antet_adres']!, _antetAdresMeta),
      );
    }
    if (data.containsKey('alt_bilgi')) {
      context.handle(
        _altBilgiMeta,
        altBilgi.isAcceptableOrUnknown(data['alt_bilgi']!, _altBilgiMeta),
      );
    }
    if (data.containsKey('yazici_bluetooth_ad')) {
      context.handle(
        _yaziciBluetoothAdMeta,
        yaziciBluetoothAd.isAcceptableOrUnknown(
          data['yazici_bluetooth_ad']!,
          _yaziciBluetoothAdMeta,
        ),
      );
    }
    if (data.containsKey('yazici_bluetooth_mac')) {
      context.handle(
        _yaziciBluetoothMacMeta,
        yaziciBluetoothMac.isAcceptableOrUnknown(
          data['yazici_bluetooth_mac']!,
          _yaziciBluetoothMacMeta,
        ),
      );
    }
    if (data.containsKey('varsayilan_donem_id')) {
      context.handle(
        _varsayilanDonemIdMeta,
        varsayilanDonemId.isAcceptableOrUnknown(
          data['varsayilan_donem_id']!,
          _varsayilanDonemIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AyarlarData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AyarlarData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      kullaniciAdi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kullanici_adi'],
      ),
      sifre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sifre'],
      ),
      kullaniciTel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kullanici_tel'],
      ),
      suM3Fiyat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}su_m3_fiyat'],
      )!,
      antetBaslik: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}antet_baslik'],
      ),
      antetAdres: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}antet_adres'],
      ),
      altBilgi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alt_bilgi'],
      ),
      yaziciBluetoothAd: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}yazici_bluetooth_ad'],
      ),
      yaziciBluetoothMac: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}yazici_bluetooth_mac'],
      ),
      varsayilanDonemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}varsayilan_donem_id'],
      ),
    );
  }

  @override
  $AyarlarTable createAlias(String alias) {
    return $AyarlarTable(attachedDatabase, alias);
  }
}

class AyarlarData extends DataClass implements Insertable<AyarlarData> {
  final int id;
  final String? kullaniciAdi;
  final String? sifre;
  final String? kullaniciTel;
  final double suM3Fiyat;
  final String? antetBaslik;
  final String? antetAdres;
  final String? altBilgi;
  final String? yaziciBluetoothAd;
  final String? yaziciBluetoothMac;
  final int? varsayilanDonemId;
  const AyarlarData({
    required this.id,
    this.kullaniciAdi,
    this.sifre,
    this.kullaniciTel,
    required this.suM3Fiyat,
    this.antetBaslik,
    this.antetAdres,
    this.altBilgi,
    this.yaziciBluetoothAd,
    this.yaziciBluetoothMac,
    this.varsayilanDonemId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || kullaniciAdi != null) {
      map['kullanici_adi'] = Variable<String>(kullaniciAdi);
    }
    if (!nullToAbsent || sifre != null) {
      map['sifre'] = Variable<String>(sifre);
    }
    if (!nullToAbsent || kullaniciTel != null) {
      map['kullanici_tel'] = Variable<String>(kullaniciTel);
    }
    map['su_m3_fiyat'] = Variable<double>(suM3Fiyat);
    if (!nullToAbsent || antetBaslik != null) {
      map['antet_baslik'] = Variable<String>(antetBaslik);
    }
    if (!nullToAbsent || antetAdres != null) {
      map['antet_adres'] = Variable<String>(antetAdres);
    }
    if (!nullToAbsent || altBilgi != null) {
      map['alt_bilgi'] = Variable<String>(altBilgi);
    }
    if (!nullToAbsent || yaziciBluetoothAd != null) {
      map['yazici_bluetooth_ad'] = Variable<String>(yaziciBluetoothAd);
    }
    if (!nullToAbsent || yaziciBluetoothMac != null) {
      map['yazici_bluetooth_mac'] = Variable<String>(yaziciBluetoothMac);
    }
    if (!nullToAbsent || varsayilanDonemId != null) {
      map['varsayilan_donem_id'] = Variable<int>(varsayilanDonemId);
    }
    return map;
  }

  AyarlarCompanion toCompanion(bool nullToAbsent) {
    return AyarlarCompanion(
      id: Value(id),
      kullaniciAdi: kullaniciAdi == null && nullToAbsent
          ? const Value.absent()
          : Value(kullaniciAdi),
      sifre: sifre == null && nullToAbsent
          ? const Value.absent()
          : Value(sifre),
      kullaniciTel: kullaniciTel == null && nullToAbsent
          ? const Value.absent()
          : Value(kullaniciTel),
      suM3Fiyat: Value(suM3Fiyat),
      antetBaslik: antetBaslik == null && nullToAbsent
          ? const Value.absent()
          : Value(antetBaslik),
      antetAdres: antetAdres == null && nullToAbsent
          ? const Value.absent()
          : Value(antetAdres),
      altBilgi: altBilgi == null && nullToAbsent
          ? const Value.absent()
          : Value(altBilgi),
      yaziciBluetoothAd: yaziciBluetoothAd == null && nullToAbsent
          ? const Value.absent()
          : Value(yaziciBluetoothAd),
      yaziciBluetoothMac: yaziciBluetoothMac == null && nullToAbsent
          ? const Value.absent()
          : Value(yaziciBluetoothMac),
      varsayilanDonemId: varsayilanDonemId == null && nullToAbsent
          ? const Value.absent()
          : Value(varsayilanDonemId),
    );
  }

  factory AyarlarData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AyarlarData(
      id: serializer.fromJson<int>(json['id']),
      kullaniciAdi: serializer.fromJson<String?>(json['kullaniciAdi']),
      sifre: serializer.fromJson<String?>(json['sifre']),
      kullaniciTel: serializer.fromJson<String?>(json['kullaniciTel']),
      suM3Fiyat: serializer.fromJson<double>(json['suM3Fiyat']),
      antetBaslik: serializer.fromJson<String?>(json['antetBaslik']),
      antetAdres: serializer.fromJson<String?>(json['antetAdres']),
      altBilgi: serializer.fromJson<String?>(json['altBilgi']),
      yaziciBluetoothAd: serializer.fromJson<String?>(
        json['yaziciBluetoothAd'],
      ),
      yaziciBluetoothMac: serializer.fromJson<String?>(
        json['yaziciBluetoothMac'],
      ),
      varsayilanDonemId: serializer.fromJson<int?>(json['varsayilanDonemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kullaniciAdi': serializer.toJson<String?>(kullaniciAdi),
      'sifre': serializer.toJson<String?>(sifre),
      'kullaniciTel': serializer.toJson<String?>(kullaniciTel),
      'suM3Fiyat': serializer.toJson<double>(suM3Fiyat),
      'antetBaslik': serializer.toJson<String?>(antetBaslik),
      'antetAdres': serializer.toJson<String?>(antetAdres),
      'altBilgi': serializer.toJson<String?>(altBilgi),
      'yaziciBluetoothAd': serializer.toJson<String?>(yaziciBluetoothAd),
      'yaziciBluetoothMac': serializer.toJson<String?>(yaziciBluetoothMac),
      'varsayilanDonemId': serializer.toJson<int?>(varsayilanDonemId),
    };
  }

  AyarlarData copyWith({
    int? id,
    Value<String?> kullaniciAdi = const Value.absent(),
    Value<String?> sifre = const Value.absent(),
    Value<String?> kullaniciTel = const Value.absent(),
    double? suM3Fiyat,
    Value<String?> antetBaslik = const Value.absent(),
    Value<String?> antetAdres = const Value.absent(),
    Value<String?> altBilgi = const Value.absent(),
    Value<String?> yaziciBluetoothAd = const Value.absent(),
    Value<String?> yaziciBluetoothMac = const Value.absent(),
    Value<int?> varsayilanDonemId = const Value.absent(),
  }) => AyarlarData(
    id: id ?? this.id,
    kullaniciAdi: kullaniciAdi.present ? kullaniciAdi.value : this.kullaniciAdi,
    sifre: sifre.present ? sifre.value : this.sifre,
    kullaniciTel: kullaniciTel.present ? kullaniciTel.value : this.kullaniciTel,
    suM3Fiyat: suM3Fiyat ?? this.suM3Fiyat,
    antetBaslik: antetBaslik.present ? antetBaslik.value : this.antetBaslik,
    antetAdres: antetAdres.present ? antetAdres.value : this.antetAdres,
    altBilgi: altBilgi.present ? altBilgi.value : this.altBilgi,
    yaziciBluetoothAd: yaziciBluetoothAd.present
        ? yaziciBluetoothAd.value
        : this.yaziciBluetoothAd,
    yaziciBluetoothMac: yaziciBluetoothMac.present
        ? yaziciBluetoothMac.value
        : this.yaziciBluetoothMac,
    varsayilanDonemId: varsayilanDonemId.present
        ? varsayilanDonemId.value
        : this.varsayilanDonemId,
  );
  AyarlarData copyWithCompanion(AyarlarCompanion data) {
    return AyarlarData(
      id: data.id.present ? data.id.value : this.id,
      kullaniciAdi: data.kullaniciAdi.present
          ? data.kullaniciAdi.value
          : this.kullaniciAdi,
      sifre: data.sifre.present ? data.sifre.value : this.sifre,
      kullaniciTel: data.kullaniciTel.present
          ? data.kullaniciTel.value
          : this.kullaniciTel,
      suM3Fiyat: data.suM3Fiyat.present ? data.suM3Fiyat.value : this.suM3Fiyat,
      antetBaslik: data.antetBaslik.present
          ? data.antetBaslik.value
          : this.antetBaslik,
      antetAdres: data.antetAdres.present
          ? data.antetAdres.value
          : this.antetAdres,
      altBilgi: data.altBilgi.present ? data.altBilgi.value : this.altBilgi,
      yaziciBluetoothAd: data.yaziciBluetoothAd.present
          ? data.yaziciBluetoothAd.value
          : this.yaziciBluetoothAd,
      yaziciBluetoothMac: data.yaziciBluetoothMac.present
          ? data.yaziciBluetoothMac.value
          : this.yaziciBluetoothMac,
      varsayilanDonemId: data.varsayilanDonemId.present
          ? data.varsayilanDonemId.value
          : this.varsayilanDonemId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AyarlarData(')
          ..write('id: $id, ')
          ..write('kullaniciAdi: $kullaniciAdi, ')
          ..write('sifre: $sifre, ')
          ..write('kullaniciTel: $kullaniciTel, ')
          ..write('suM3Fiyat: $suM3Fiyat, ')
          ..write('antetBaslik: $antetBaslik, ')
          ..write('antetAdres: $antetAdres, ')
          ..write('altBilgi: $altBilgi, ')
          ..write('yaziciBluetoothAd: $yaziciBluetoothAd, ')
          ..write('yaziciBluetoothMac: $yaziciBluetoothMac, ')
          ..write('varsayilanDonemId: $varsayilanDonemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    kullaniciAdi,
    sifre,
    kullaniciTel,
    suM3Fiyat,
    antetBaslik,
    antetAdres,
    altBilgi,
    yaziciBluetoothAd,
    yaziciBluetoothMac,
    varsayilanDonemId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AyarlarData &&
          other.id == this.id &&
          other.kullaniciAdi == this.kullaniciAdi &&
          other.sifre == this.sifre &&
          other.kullaniciTel == this.kullaniciTel &&
          other.suM3Fiyat == this.suM3Fiyat &&
          other.antetBaslik == this.antetBaslik &&
          other.antetAdres == this.antetAdres &&
          other.altBilgi == this.altBilgi &&
          other.yaziciBluetoothAd == this.yaziciBluetoothAd &&
          other.yaziciBluetoothMac == this.yaziciBluetoothMac &&
          other.varsayilanDonemId == this.varsayilanDonemId);
}

class AyarlarCompanion extends UpdateCompanion<AyarlarData> {
  final Value<int> id;
  final Value<String?> kullaniciAdi;
  final Value<String?> sifre;
  final Value<String?> kullaniciTel;
  final Value<double> suM3Fiyat;
  final Value<String?> antetBaslik;
  final Value<String?> antetAdres;
  final Value<String?> altBilgi;
  final Value<String?> yaziciBluetoothAd;
  final Value<String?> yaziciBluetoothMac;
  final Value<int?> varsayilanDonemId;
  const AyarlarCompanion({
    this.id = const Value.absent(),
    this.kullaniciAdi = const Value.absent(),
    this.sifre = const Value.absent(),
    this.kullaniciTel = const Value.absent(),
    this.suM3Fiyat = const Value.absent(),
    this.antetBaslik = const Value.absent(),
    this.antetAdres = const Value.absent(),
    this.altBilgi = const Value.absent(),
    this.yaziciBluetoothAd = const Value.absent(),
    this.yaziciBluetoothMac = const Value.absent(),
    this.varsayilanDonemId = const Value.absent(),
  });
  AyarlarCompanion.insert({
    this.id = const Value.absent(),
    this.kullaniciAdi = const Value.absent(),
    this.sifre = const Value.absent(),
    this.kullaniciTel = const Value.absent(),
    this.suM3Fiyat = const Value.absent(),
    this.antetBaslik = const Value.absent(),
    this.antetAdres = const Value.absent(),
    this.altBilgi = const Value.absent(),
    this.yaziciBluetoothAd = const Value.absent(),
    this.yaziciBluetoothMac = const Value.absent(),
    this.varsayilanDonemId = const Value.absent(),
  });
  static Insertable<AyarlarData> custom({
    Expression<int>? id,
    Expression<String>? kullaniciAdi,
    Expression<String>? sifre,
    Expression<String>? kullaniciTel,
    Expression<double>? suM3Fiyat,
    Expression<String>? antetBaslik,
    Expression<String>? antetAdres,
    Expression<String>? altBilgi,
    Expression<String>? yaziciBluetoothAd,
    Expression<String>? yaziciBluetoothMac,
    Expression<int>? varsayilanDonemId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kullaniciAdi != null) 'kullanici_adi': kullaniciAdi,
      if (sifre != null) 'sifre': sifre,
      if (kullaniciTel != null) 'kullanici_tel': kullaniciTel,
      if (suM3Fiyat != null) 'su_m3_fiyat': suM3Fiyat,
      if (antetBaslik != null) 'antet_baslik': antetBaslik,
      if (antetAdres != null) 'antet_adres': antetAdres,
      if (altBilgi != null) 'alt_bilgi': altBilgi,
      if (yaziciBluetoothAd != null) 'yazici_bluetooth_ad': yaziciBluetoothAd,
      if (yaziciBluetoothMac != null)
        'yazici_bluetooth_mac': yaziciBluetoothMac,
      if (varsayilanDonemId != null) 'varsayilan_donem_id': varsayilanDonemId,
    });
  }

  AyarlarCompanion copyWith({
    Value<int>? id,
    Value<String?>? kullaniciAdi,
    Value<String?>? sifre,
    Value<String?>? kullaniciTel,
    Value<double>? suM3Fiyat,
    Value<String?>? antetBaslik,
    Value<String?>? antetAdres,
    Value<String?>? altBilgi,
    Value<String?>? yaziciBluetoothAd,
    Value<String?>? yaziciBluetoothMac,
    Value<int?>? varsayilanDonemId,
  }) {
    return AyarlarCompanion(
      id: id ?? this.id,
      kullaniciAdi: kullaniciAdi ?? this.kullaniciAdi,
      sifre: sifre ?? this.sifre,
      kullaniciTel: kullaniciTel ?? this.kullaniciTel,
      suM3Fiyat: suM3Fiyat ?? this.suM3Fiyat,
      antetBaslik: antetBaslik ?? this.antetBaslik,
      antetAdres: antetAdres ?? this.antetAdres,
      altBilgi: altBilgi ?? this.altBilgi,
      yaziciBluetoothAd: yaziciBluetoothAd ?? this.yaziciBluetoothAd,
      yaziciBluetoothMac: yaziciBluetoothMac ?? this.yaziciBluetoothMac,
      varsayilanDonemId: varsayilanDonemId ?? this.varsayilanDonemId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kullaniciAdi.present) {
      map['kullanici_adi'] = Variable<String>(kullaniciAdi.value);
    }
    if (sifre.present) {
      map['sifre'] = Variable<String>(sifre.value);
    }
    if (kullaniciTel.present) {
      map['kullanici_tel'] = Variable<String>(kullaniciTel.value);
    }
    if (suM3Fiyat.present) {
      map['su_m3_fiyat'] = Variable<double>(suM3Fiyat.value);
    }
    if (antetBaslik.present) {
      map['antet_baslik'] = Variable<String>(antetBaslik.value);
    }
    if (antetAdres.present) {
      map['antet_adres'] = Variable<String>(antetAdres.value);
    }
    if (altBilgi.present) {
      map['alt_bilgi'] = Variable<String>(altBilgi.value);
    }
    if (yaziciBluetoothAd.present) {
      map['yazici_bluetooth_ad'] = Variable<String>(yaziciBluetoothAd.value);
    }
    if (yaziciBluetoothMac.present) {
      map['yazici_bluetooth_mac'] = Variable<String>(yaziciBluetoothMac.value);
    }
    if (varsayilanDonemId.present) {
      map['varsayilan_donem_id'] = Variable<int>(varsayilanDonemId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AyarlarCompanion(')
          ..write('id: $id, ')
          ..write('kullaniciAdi: $kullaniciAdi, ')
          ..write('sifre: $sifre, ')
          ..write('kullaniciTel: $kullaniciTel, ')
          ..write('suM3Fiyat: $suM3Fiyat, ')
          ..write('antetBaslik: $antetBaslik, ')
          ..write('antetAdres: $antetAdres, ')
          ..write('altBilgi: $altBilgi, ')
          ..write('yaziciBluetoothAd: $yaziciBluetoothAd, ')
          ..write('yaziciBluetoothMac: $yaziciBluetoothMac, ')
          ..write('varsayilanDonemId: $varsayilanDonemId')
          ..write(')'))
        .toString();
  }
}

class $DonemlerTable extends Donemler
    with TableInfo<$DonemlerTable, DonemlerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DonemlerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _adMeta = const VerificationMeta('ad');
  @override
  late final GeneratedColumn<String> ad = GeneratedColumn<String>(
    'ad',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baslangicTarihiMeta = const VerificationMeta(
    'baslangicTarihi',
  );
  @override
  late final GeneratedColumn<String> baslangicTarihi = GeneratedColumn<String>(
    'baslangic_tarihi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bitisTarihiMeta = const VerificationMeta(
    'bitisTarihi',
  );
  @override
  late final GeneratedColumn<String> bitisTarihi = GeneratedColumn<String>(
    'bitis_tarihi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sonOdemeTarihiMeta = const VerificationMeta(
    'sonOdemeTarihi',
  );
  @override
  late final GeneratedColumn<String> sonOdemeTarihi = GeneratedColumn<String>(
    'son_odeme_tarihi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ad,
    baslangicTarihi,
    bitisTarihi,
    sonOdemeTarihi,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'donemler';
  @override
  VerificationContext validateIntegrity(
    Insertable<DonemlerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ad')) {
      context.handle(_adMeta, ad.isAcceptableOrUnknown(data['ad']!, _adMeta));
    } else if (isInserting) {
      context.missing(_adMeta);
    }
    if (data.containsKey('baslangic_tarihi')) {
      context.handle(
        _baslangicTarihiMeta,
        baslangicTarihi.isAcceptableOrUnknown(
          data['baslangic_tarihi']!,
          _baslangicTarihiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baslangicTarihiMeta);
    }
    if (data.containsKey('bitis_tarihi')) {
      context.handle(
        _bitisTarihiMeta,
        bitisTarihi.isAcceptableOrUnknown(
          data['bitis_tarihi']!,
          _bitisTarihiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bitisTarihiMeta);
    }
    if (data.containsKey('son_odeme_tarihi')) {
      context.handle(
        _sonOdemeTarihiMeta,
        sonOdemeTarihi.isAcceptableOrUnknown(
          data['son_odeme_tarihi']!,
          _sonOdemeTarihiMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DonemlerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DonemlerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ad'],
      )!,
      baslangicTarihi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}baslangic_tarihi'],
      )!,
      bitisTarihi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bitis_tarihi'],
      )!,
      sonOdemeTarihi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}son_odeme_tarihi'],
      ),
    );
  }

  @override
  $DonemlerTable createAlias(String alias) {
    return $DonemlerTable(attachedDatabase, alias);
  }
}

class DonemlerData extends DataClass implements Insertable<DonemlerData> {
  final int id;
  final String ad;
  final String baslangicTarihi;
  final String bitisTarihi;
  final String? sonOdemeTarihi;
  const DonemlerData({
    required this.id,
    required this.ad,
    required this.baslangicTarihi,
    required this.bitisTarihi,
    this.sonOdemeTarihi,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ad'] = Variable<String>(ad);
    map['baslangic_tarihi'] = Variable<String>(baslangicTarihi);
    map['bitis_tarihi'] = Variable<String>(bitisTarihi);
    if (!nullToAbsent || sonOdemeTarihi != null) {
      map['son_odeme_tarihi'] = Variable<String>(sonOdemeTarihi);
    }
    return map;
  }

  DonemlerCompanion toCompanion(bool nullToAbsent) {
    return DonemlerCompanion(
      id: Value(id),
      ad: Value(ad),
      baslangicTarihi: Value(baslangicTarihi),
      bitisTarihi: Value(bitisTarihi),
      sonOdemeTarihi: sonOdemeTarihi == null && nullToAbsent
          ? const Value.absent()
          : Value(sonOdemeTarihi),
    );
  }

  factory DonemlerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DonemlerData(
      id: serializer.fromJson<int>(json['id']),
      ad: serializer.fromJson<String>(json['ad']),
      baslangicTarihi: serializer.fromJson<String>(json['baslangicTarihi']),
      bitisTarihi: serializer.fromJson<String>(json['bitisTarihi']),
      sonOdemeTarihi: serializer.fromJson<String?>(json['sonOdemeTarihi']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ad': serializer.toJson<String>(ad),
      'baslangicTarihi': serializer.toJson<String>(baslangicTarihi),
      'bitisTarihi': serializer.toJson<String>(bitisTarihi),
      'sonOdemeTarihi': serializer.toJson<String?>(sonOdemeTarihi),
    };
  }

  DonemlerData copyWith({
    int? id,
    String? ad,
    String? baslangicTarihi,
    String? bitisTarihi,
    Value<String?> sonOdemeTarihi = const Value.absent(),
  }) => DonemlerData(
    id: id ?? this.id,
    ad: ad ?? this.ad,
    baslangicTarihi: baslangicTarihi ?? this.baslangicTarihi,
    bitisTarihi: bitisTarihi ?? this.bitisTarihi,
    sonOdemeTarihi: sonOdemeTarihi.present
        ? sonOdemeTarihi.value
        : this.sonOdemeTarihi,
  );
  DonemlerData copyWithCompanion(DonemlerCompanion data) {
    return DonemlerData(
      id: data.id.present ? data.id.value : this.id,
      ad: data.ad.present ? data.ad.value : this.ad,
      baslangicTarihi: data.baslangicTarihi.present
          ? data.baslangicTarihi.value
          : this.baslangicTarihi,
      bitisTarihi: data.bitisTarihi.present
          ? data.bitisTarihi.value
          : this.bitisTarihi,
      sonOdemeTarihi: data.sonOdemeTarihi.present
          ? data.sonOdemeTarihi.value
          : this.sonOdemeTarihi,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DonemlerData(')
          ..write('id: $id, ')
          ..write('ad: $ad, ')
          ..write('baslangicTarihi: $baslangicTarihi, ')
          ..write('bitisTarihi: $bitisTarihi, ')
          ..write('sonOdemeTarihi: $sonOdemeTarihi')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ad, baslangicTarihi, bitisTarihi, sonOdemeTarihi);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DonemlerData &&
          other.id == this.id &&
          other.ad == this.ad &&
          other.baslangicTarihi == this.baslangicTarihi &&
          other.bitisTarihi == this.bitisTarihi &&
          other.sonOdemeTarihi == this.sonOdemeTarihi);
}

class DonemlerCompanion extends UpdateCompanion<DonemlerData> {
  final Value<int> id;
  final Value<String> ad;
  final Value<String> baslangicTarihi;
  final Value<String> bitisTarihi;
  final Value<String?> sonOdemeTarihi;
  const DonemlerCompanion({
    this.id = const Value.absent(),
    this.ad = const Value.absent(),
    this.baslangicTarihi = const Value.absent(),
    this.bitisTarihi = const Value.absent(),
    this.sonOdemeTarihi = const Value.absent(),
  });
  DonemlerCompanion.insert({
    this.id = const Value.absent(),
    required String ad,
    required String baslangicTarihi,
    required String bitisTarihi,
    this.sonOdemeTarihi = const Value.absent(),
  }) : ad = Value(ad),
       baslangicTarihi = Value(baslangicTarihi),
       bitisTarihi = Value(bitisTarihi);
  static Insertable<DonemlerData> custom({
    Expression<int>? id,
    Expression<String>? ad,
    Expression<String>? baslangicTarihi,
    Expression<String>? bitisTarihi,
    Expression<String>? sonOdemeTarihi,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ad != null) 'ad': ad,
      if (baslangicTarihi != null) 'baslangic_tarihi': baslangicTarihi,
      if (bitisTarihi != null) 'bitis_tarihi': bitisTarihi,
      if (sonOdemeTarihi != null) 'son_odeme_tarihi': sonOdemeTarihi,
    });
  }

  DonemlerCompanion copyWith({
    Value<int>? id,
    Value<String>? ad,
    Value<String>? baslangicTarihi,
    Value<String>? bitisTarihi,
    Value<String?>? sonOdemeTarihi,
  }) {
    return DonemlerCompanion(
      id: id ?? this.id,
      ad: ad ?? this.ad,
      baslangicTarihi: baslangicTarihi ?? this.baslangicTarihi,
      bitisTarihi: bitisTarihi ?? this.bitisTarihi,
      sonOdemeTarihi: sonOdemeTarihi ?? this.sonOdemeTarihi,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ad.present) {
      map['ad'] = Variable<String>(ad.value);
    }
    if (baslangicTarihi.present) {
      map['baslangic_tarihi'] = Variable<String>(baslangicTarihi.value);
    }
    if (bitisTarihi.present) {
      map['bitis_tarihi'] = Variable<String>(bitisTarihi.value);
    }
    if (sonOdemeTarihi.present) {
      map['son_odeme_tarihi'] = Variable<String>(sonOdemeTarihi.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DonemlerCompanion(')
          ..write('id: $id, ')
          ..write('ad: $ad, ')
          ..write('baslangicTarihi: $baslangicTarihi, ')
          ..write('bitisTarihi: $bitisTarihi, ')
          ..write('sonOdemeTarihi: $sonOdemeTarihi')
          ..write(')'))
        .toString();
  }
}

class $AbonelerTable extends Aboneler
    with TableInfo<$AbonelerTable, AbonelerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AbonelerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _adMeta = const VerificationMeta('ad');
  @override
  late final GeneratedColumn<String> ad = GeneratedColumn<String>(
    'ad',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _soyadMeta = const VerificationMeta('soyad');
  @override
  late final GeneratedColumn<String> soyad = GeneratedColumn<String>(
    'soyad',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telMeta = const VerificationMeta('tel');
  @override
  late final GeneratedColumn<String> tel = GeneratedColumn<String>(
    'tel',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aboneNoMeta = const VerificationMeta(
    'aboneNo',
  );
  @override
  late final GeneratedColumn<String> aboneNo = GeneratedColumn<String>(
    'abone_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saatNoMeta = const VerificationMeta('saatNo');
  @override
  late final GeneratedColumn<String> saatNo = GeneratedColumn<String>(
    'saat_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _saatDurumuMeta = const VerificationMeta(
    'saatDurumu',
  );
  @override
  late final GeneratedColumn<String> saatDurumu = GeneratedColumn<String>(
    'saat_durumu',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints:
        'CHECK (saat_durumu IN (\'normal\', \'ters\', \'arızalı\') OR saat_durumu IS NULL)',
  );
  static const VerificationMeta _adresMeta = const VerificationMeta('adres');
  @override
  late final GeneratedColumn<String> adres = GeneratedColumn<String>(
    'adres',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aciklamaMeta = const VerificationMeta(
    'aciklama',
  );
  @override
  late final GeneratedColumn<String> aciklama = GeneratedColumn<String>(
    'aciklama',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aktifMeta = const VerificationMeta('aktif');
  @override
  late final GeneratedColumn<int> aktif = GeneratedColumn<int>(
    'aktif',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ad,
    soyad,
    tel,
    aboneNo,
    saatNo,
    saatDurumu,
    adres,
    aciklama,
    aktif,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'aboneler';
  @override
  VerificationContext validateIntegrity(
    Insertable<AbonelerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ad')) {
      context.handle(_adMeta, ad.isAcceptableOrUnknown(data['ad']!, _adMeta));
    } else if (isInserting) {
      context.missing(_adMeta);
    }
    if (data.containsKey('soyad')) {
      context.handle(
        _soyadMeta,
        soyad.isAcceptableOrUnknown(data['soyad']!, _soyadMeta),
      );
    }
    if (data.containsKey('tel')) {
      context.handle(
        _telMeta,
        tel.isAcceptableOrUnknown(data['tel']!, _telMeta),
      );
    }
    if (data.containsKey('abone_no')) {
      context.handle(
        _aboneNoMeta,
        aboneNo.isAcceptableOrUnknown(data['abone_no']!, _aboneNoMeta),
      );
    } else if (isInserting) {
      context.missing(_aboneNoMeta);
    }
    if (data.containsKey('saat_no')) {
      context.handle(
        _saatNoMeta,
        saatNo.isAcceptableOrUnknown(data['saat_no']!, _saatNoMeta),
      );
    }
    if (data.containsKey('saat_durumu')) {
      context.handle(
        _saatDurumuMeta,
        saatDurumu.isAcceptableOrUnknown(data['saat_durumu']!, _saatDurumuMeta),
      );
    }
    if (data.containsKey('adres')) {
      context.handle(
        _adresMeta,
        adres.isAcceptableOrUnknown(data['adres']!, _adresMeta),
      );
    }
    if (data.containsKey('aciklama')) {
      context.handle(
        _aciklamaMeta,
        aciklama.isAcceptableOrUnknown(data['aciklama']!, _aciklamaMeta),
      );
    }
    if (data.containsKey('aktif')) {
      context.handle(
        _aktifMeta,
        aktif.isAcceptableOrUnknown(data['aktif']!, _aktifMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AbonelerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AbonelerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ad'],
      )!,
      soyad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}soyad'],
      ),
      tel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tel'],
      ),
      aboneNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}abone_no'],
      )!,
      saatNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}saat_no'],
      ),
      saatDurumu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}saat_durumu'],
      ),
      adres: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}adres'],
      ),
      aciklama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aciklama'],
      ),
      aktif: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}aktif'],
      )!,
    );
  }

  @override
  $AbonelerTable createAlias(String alias) {
    return $AbonelerTable(attachedDatabase, alias);
  }
}

class AbonelerData extends DataClass implements Insertable<AbonelerData> {
  final int id;
  final String ad;
  final String? soyad;
  final String? tel;
  final String aboneNo;
  final String? saatNo;
  final String? saatDurumu;
  final String? adres;
  final String? aciklama;
  final int aktif;
  const AbonelerData({
    required this.id,
    required this.ad,
    this.soyad,
    this.tel,
    required this.aboneNo,
    this.saatNo,
    this.saatDurumu,
    this.adres,
    this.aciklama,
    required this.aktif,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ad'] = Variable<String>(ad);
    if (!nullToAbsent || soyad != null) {
      map['soyad'] = Variable<String>(soyad);
    }
    if (!nullToAbsent || tel != null) {
      map['tel'] = Variable<String>(tel);
    }
    map['abone_no'] = Variable<String>(aboneNo);
    if (!nullToAbsent || saatNo != null) {
      map['saat_no'] = Variable<String>(saatNo);
    }
    if (!nullToAbsent || saatDurumu != null) {
      map['saat_durumu'] = Variable<String>(saatDurumu);
    }
    if (!nullToAbsent || adres != null) {
      map['adres'] = Variable<String>(adres);
    }
    if (!nullToAbsent || aciklama != null) {
      map['aciklama'] = Variable<String>(aciklama);
    }
    map['aktif'] = Variable<int>(aktif);
    return map;
  }

  AbonelerCompanion toCompanion(bool nullToAbsent) {
    return AbonelerCompanion(
      id: Value(id),
      ad: Value(ad),
      soyad: soyad == null && nullToAbsent
          ? const Value.absent()
          : Value(soyad),
      tel: tel == null && nullToAbsent ? const Value.absent() : Value(tel),
      aboneNo: Value(aboneNo),
      saatNo: saatNo == null && nullToAbsent
          ? const Value.absent()
          : Value(saatNo),
      saatDurumu: saatDurumu == null && nullToAbsent
          ? const Value.absent()
          : Value(saatDurumu),
      adres: adres == null && nullToAbsent
          ? const Value.absent()
          : Value(adres),
      aciklama: aciklama == null && nullToAbsent
          ? const Value.absent()
          : Value(aciklama),
      aktif: Value(aktif),
    );
  }

  factory AbonelerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AbonelerData(
      id: serializer.fromJson<int>(json['id']),
      ad: serializer.fromJson<String>(json['ad']),
      soyad: serializer.fromJson<String?>(json['soyad']),
      tel: serializer.fromJson<String?>(json['tel']),
      aboneNo: serializer.fromJson<String>(json['aboneNo']),
      saatNo: serializer.fromJson<String?>(json['saatNo']),
      saatDurumu: serializer.fromJson<String?>(json['saatDurumu']),
      adres: serializer.fromJson<String?>(json['adres']),
      aciklama: serializer.fromJson<String?>(json['aciklama']),
      aktif: serializer.fromJson<int>(json['aktif']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ad': serializer.toJson<String>(ad),
      'soyad': serializer.toJson<String?>(soyad),
      'tel': serializer.toJson<String?>(tel),
      'aboneNo': serializer.toJson<String>(aboneNo),
      'saatNo': serializer.toJson<String?>(saatNo),
      'saatDurumu': serializer.toJson<String?>(saatDurumu),
      'adres': serializer.toJson<String?>(adres),
      'aciklama': serializer.toJson<String?>(aciklama),
      'aktif': serializer.toJson<int>(aktif),
    };
  }

  AbonelerData copyWith({
    int? id,
    String? ad,
    Value<String?> soyad = const Value.absent(),
    Value<String?> tel = const Value.absent(),
    String? aboneNo,
    Value<String?> saatNo = const Value.absent(),
    Value<String?> saatDurumu = const Value.absent(),
    Value<String?> adres = const Value.absent(),
    Value<String?> aciklama = const Value.absent(),
    int? aktif,
  }) => AbonelerData(
    id: id ?? this.id,
    ad: ad ?? this.ad,
    soyad: soyad.present ? soyad.value : this.soyad,
    tel: tel.present ? tel.value : this.tel,
    aboneNo: aboneNo ?? this.aboneNo,
    saatNo: saatNo.present ? saatNo.value : this.saatNo,
    saatDurumu: saatDurumu.present ? saatDurumu.value : this.saatDurumu,
    adres: adres.present ? adres.value : this.adres,
    aciklama: aciklama.present ? aciklama.value : this.aciklama,
    aktif: aktif ?? this.aktif,
  );
  AbonelerData copyWithCompanion(AbonelerCompanion data) {
    return AbonelerData(
      id: data.id.present ? data.id.value : this.id,
      ad: data.ad.present ? data.ad.value : this.ad,
      soyad: data.soyad.present ? data.soyad.value : this.soyad,
      tel: data.tel.present ? data.tel.value : this.tel,
      aboneNo: data.aboneNo.present ? data.aboneNo.value : this.aboneNo,
      saatNo: data.saatNo.present ? data.saatNo.value : this.saatNo,
      saatDurumu: data.saatDurumu.present
          ? data.saatDurumu.value
          : this.saatDurumu,
      adres: data.adres.present ? data.adres.value : this.adres,
      aciklama: data.aciklama.present ? data.aciklama.value : this.aciklama,
      aktif: data.aktif.present ? data.aktif.value : this.aktif,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AbonelerData(')
          ..write('id: $id, ')
          ..write('ad: $ad, ')
          ..write('soyad: $soyad, ')
          ..write('tel: $tel, ')
          ..write('aboneNo: $aboneNo, ')
          ..write('saatNo: $saatNo, ')
          ..write('saatDurumu: $saatDurumu, ')
          ..write('adres: $adres, ')
          ..write('aciklama: $aciklama, ')
          ..write('aktif: $aktif')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ad,
    soyad,
    tel,
    aboneNo,
    saatNo,
    saatDurumu,
    adres,
    aciklama,
    aktif,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AbonelerData &&
          other.id == this.id &&
          other.ad == this.ad &&
          other.soyad == this.soyad &&
          other.tel == this.tel &&
          other.aboneNo == this.aboneNo &&
          other.saatNo == this.saatNo &&
          other.saatDurumu == this.saatDurumu &&
          other.adres == this.adres &&
          other.aciklama == this.aciklama &&
          other.aktif == this.aktif);
}

class AbonelerCompanion extends UpdateCompanion<AbonelerData> {
  final Value<int> id;
  final Value<String> ad;
  final Value<String?> soyad;
  final Value<String?> tel;
  final Value<String> aboneNo;
  final Value<String?> saatNo;
  final Value<String?> saatDurumu;
  final Value<String?> adres;
  final Value<String?> aciklama;
  final Value<int> aktif;
  const AbonelerCompanion({
    this.id = const Value.absent(),
    this.ad = const Value.absent(),
    this.soyad = const Value.absent(),
    this.tel = const Value.absent(),
    this.aboneNo = const Value.absent(),
    this.saatNo = const Value.absent(),
    this.saatDurumu = const Value.absent(),
    this.adres = const Value.absent(),
    this.aciklama = const Value.absent(),
    this.aktif = const Value.absent(),
  });
  AbonelerCompanion.insert({
    this.id = const Value.absent(),
    required String ad,
    this.soyad = const Value.absent(),
    this.tel = const Value.absent(),
    required String aboneNo,
    this.saatNo = const Value.absent(),
    this.saatDurumu = const Value.absent(),
    this.adres = const Value.absent(),
    this.aciklama = const Value.absent(),
    this.aktif = const Value.absent(),
  }) : ad = Value(ad),
       aboneNo = Value(aboneNo);
  static Insertable<AbonelerData> custom({
    Expression<int>? id,
    Expression<String>? ad,
    Expression<String>? soyad,
    Expression<String>? tel,
    Expression<String>? aboneNo,
    Expression<String>? saatNo,
    Expression<String>? saatDurumu,
    Expression<String>? adres,
    Expression<String>? aciklama,
    Expression<int>? aktif,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ad != null) 'ad': ad,
      if (soyad != null) 'soyad': soyad,
      if (tel != null) 'tel': tel,
      if (aboneNo != null) 'abone_no': aboneNo,
      if (saatNo != null) 'saat_no': saatNo,
      if (saatDurumu != null) 'saat_durumu': saatDurumu,
      if (adres != null) 'adres': adres,
      if (aciklama != null) 'aciklama': aciklama,
      if (aktif != null) 'aktif': aktif,
    });
  }

  AbonelerCompanion copyWith({
    Value<int>? id,
    Value<String>? ad,
    Value<String?>? soyad,
    Value<String?>? tel,
    Value<String>? aboneNo,
    Value<String?>? saatNo,
    Value<String?>? saatDurumu,
    Value<String?>? adres,
    Value<String?>? aciklama,
    Value<int>? aktif,
  }) {
    return AbonelerCompanion(
      id: id ?? this.id,
      ad: ad ?? this.ad,
      soyad: soyad ?? this.soyad,
      tel: tel ?? this.tel,
      aboneNo: aboneNo ?? this.aboneNo,
      saatNo: saatNo ?? this.saatNo,
      saatDurumu: saatDurumu ?? this.saatDurumu,
      adres: adres ?? this.adres,
      aciklama: aciklama ?? this.aciklama,
      aktif: aktif ?? this.aktif,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ad.present) {
      map['ad'] = Variable<String>(ad.value);
    }
    if (soyad.present) {
      map['soyad'] = Variable<String>(soyad.value);
    }
    if (tel.present) {
      map['tel'] = Variable<String>(tel.value);
    }
    if (aboneNo.present) {
      map['abone_no'] = Variable<String>(aboneNo.value);
    }
    if (saatNo.present) {
      map['saat_no'] = Variable<String>(saatNo.value);
    }
    if (saatDurumu.present) {
      map['saat_durumu'] = Variable<String>(saatDurumu.value);
    }
    if (adres.present) {
      map['adres'] = Variable<String>(adres.value);
    }
    if (aciklama.present) {
      map['aciklama'] = Variable<String>(aciklama.value);
    }
    if (aktif.present) {
      map['aktif'] = Variable<int>(aktif.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AbonelerCompanion(')
          ..write('id: $id, ')
          ..write('ad: $ad, ')
          ..write('soyad: $soyad, ')
          ..write('tel: $tel, ')
          ..write('aboneNo: $aboneNo, ')
          ..write('saatNo: $saatNo, ')
          ..write('saatDurumu: $saatDurumu, ')
          ..write('adres: $adres, ')
          ..write('aciklama: $aciklama, ')
          ..write('aktif: $aktif')
          ..write(')'))
        .toString();
  }
}

class $EndekslerTable extends Endeksler
    with TableInfo<$EndekslerTable, EndekslerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EndekslerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _aboneIdMeta = const VerificationMeta(
    'aboneId',
  );
  @override
  late final GeneratedColumn<int> aboneId = GeneratedColumn<int>(
    'abone_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES aboneler (id)',
    ),
  );
  static const VerificationMeta _tarihMeta = const VerificationMeta('tarih');
  @override
  late final GeneratedColumn<String> tarih = GeneratedColumn<String>(
    'tarih',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endeksMeta = const VerificationMeta('endeks');
  @override
  late final GeneratedColumn<double> endeks = GeneratedColumn<double>(
    'endeks',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _okuyanKisiMeta = const VerificationMeta(
    'okuyanKisi',
  );
  @override
  late final GeneratedColumn<String> okuyanKisi = GeneratedColumn<String>(
    'okuyan_kisi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fotoPathMeta = const VerificationMeta(
    'fotoPath',
  );
  @override
  late final GeneratedColumn<String> fotoPath = GeneratedColumn<String>(
    'foto_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aciklamaMeta = const VerificationMeta(
    'aciklama',
  );
  @override
  late final GeneratedColumn<String> aciklama = GeneratedColumn<String>(
    'aciklama',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    aboneId,
    tarih,
    endeks,
    okuyanKisi,
    fotoPath,
    aciklama,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'endeksler';
  @override
  VerificationContext validateIntegrity(
    Insertable<EndekslerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('abone_id')) {
      context.handle(
        _aboneIdMeta,
        aboneId.isAcceptableOrUnknown(data['abone_id']!, _aboneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_aboneIdMeta);
    }
    if (data.containsKey('tarih')) {
      context.handle(
        _tarihMeta,
        tarih.isAcceptableOrUnknown(data['tarih']!, _tarihMeta),
      );
    } else if (isInserting) {
      context.missing(_tarihMeta);
    }
    if (data.containsKey('endeks')) {
      context.handle(
        _endeksMeta,
        endeks.isAcceptableOrUnknown(data['endeks']!, _endeksMeta),
      );
    } else if (isInserting) {
      context.missing(_endeksMeta);
    }
    if (data.containsKey('okuyan_kisi')) {
      context.handle(
        _okuyanKisiMeta,
        okuyanKisi.isAcceptableOrUnknown(data['okuyan_kisi']!, _okuyanKisiMeta),
      );
    }
    if (data.containsKey('foto_path')) {
      context.handle(
        _fotoPathMeta,
        fotoPath.isAcceptableOrUnknown(data['foto_path']!, _fotoPathMeta),
      );
    }
    if (data.containsKey('aciklama')) {
      context.handle(
        _aciklamaMeta,
        aciklama.isAcceptableOrUnknown(data['aciklama']!, _aciklamaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EndekslerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EndekslerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      aboneId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}abone_id'],
      )!,
      tarih: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tarih'],
      )!,
      endeks: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}endeks'],
      )!,
      okuyanKisi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}okuyan_kisi'],
      ),
      fotoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto_path'],
      ),
      aciklama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aciklama'],
      ),
    );
  }

  @override
  $EndekslerTable createAlias(String alias) {
    return $EndekslerTable(attachedDatabase, alias);
  }
}

class EndekslerData extends DataClass implements Insertable<EndekslerData> {
  final int id;
  final int aboneId;
  final String tarih;
  final double endeks;
  final String? okuyanKisi;
  final String? fotoPath;
  final String? aciklama;
  const EndekslerData({
    required this.id,
    required this.aboneId,
    required this.tarih,
    required this.endeks,
    this.okuyanKisi,
    this.fotoPath,
    this.aciklama,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['abone_id'] = Variable<int>(aboneId);
    map['tarih'] = Variable<String>(tarih);
    map['endeks'] = Variable<double>(endeks);
    if (!nullToAbsent || okuyanKisi != null) {
      map['okuyan_kisi'] = Variable<String>(okuyanKisi);
    }
    if (!nullToAbsent || fotoPath != null) {
      map['foto_path'] = Variable<String>(fotoPath);
    }
    if (!nullToAbsent || aciklama != null) {
      map['aciklama'] = Variable<String>(aciklama);
    }
    return map;
  }

  EndekslerCompanion toCompanion(bool nullToAbsent) {
    return EndekslerCompanion(
      id: Value(id),
      aboneId: Value(aboneId),
      tarih: Value(tarih),
      endeks: Value(endeks),
      okuyanKisi: okuyanKisi == null && nullToAbsent
          ? const Value.absent()
          : Value(okuyanKisi),
      fotoPath: fotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(fotoPath),
      aciklama: aciklama == null && nullToAbsent
          ? const Value.absent()
          : Value(aciklama),
    );
  }

  factory EndekslerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EndekslerData(
      id: serializer.fromJson<int>(json['id']),
      aboneId: serializer.fromJson<int>(json['aboneId']),
      tarih: serializer.fromJson<String>(json['tarih']),
      endeks: serializer.fromJson<double>(json['endeks']),
      okuyanKisi: serializer.fromJson<String?>(json['okuyanKisi']),
      fotoPath: serializer.fromJson<String?>(json['fotoPath']),
      aciklama: serializer.fromJson<String?>(json['aciklama']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'aboneId': serializer.toJson<int>(aboneId),
      'tarih': serializer.toJson<String>(tarih),
      'endeks': serializer.toJson<double>(endeks),
      'okuyanKisi': serializer.toJson<String?>(okuyanKisi),
      'fotoPath': serializer.toJson<String?>(fotoPath),
      'aciklama': serializer.toJson<String?>(aciklama),
    };
  }

  EndekslerData copyWith({
    int? id,
    int? aboneId,
    String? tarih,
    double? endeks,
    Value<String?> okuyanKisi = const Value.absent(),
    Value<String?> fotoPath = const Value.absent(),
    Value<String?> aciklama = const Value.absent(),
  }) => EndekslerData(
    id: id ?? this.id,
    aboneId: aboneId ?? this.aboneId,
    tarih: tarih ?? this.tarih,
    endeks: endeks ?? this.endeks,
    okuyanKisi: okuyanKisi.present ? okuyanKisi.value : this.okuyanKisi,
    fotoPath: fotoPath.present ? fotoPath.value : this.fotoPath,
    aciklama: aciklama.present ? aciklama.value : this.aciklama,
  );
  EndekslerData copyWithCompanion(EndekslerCompanion data) {
    return EndekslerData(
      id: data.id.present ? data.id.value : this.id,
      aboneId: data.aboneId.present ? data.aboneId.value : this.aboneId,
      tarih: data.tarih.present ? data.tarih.value : this.tarih,
      endeks: data.endeks.present ? data.endeks.value : this.endeks,
      okuyanKisi: data.okuyanKisi.present
          ? data.okuyanKisi.value
          : this.okuyanKisi,
      fotoPath: data.fotoPath.present ? data.fotoPath.value : this.fotoPath,
      aciklama: data.aciklama.present ? data.aciklama.value : this.aciklama,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EndekslerData(')
          ..write('id: $id, ')
          ..write('aboneId: $aboneId, ')
          ..write('tarih: $tarih, ')
          ..write('endeks: $endeks, ')
          ..write('okuyanKisi: $okuyanKisi, ')
          ..write('fotoPath: $fotoPath, ')
          ..write('aciklama: $aciklama')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, aboneId, tarih, endeks, okuyanKisi, fotoPath, aciklama);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EndekslerData &&
          other.id == this.id &&
          other.aboneId == this.aboneId &&
          other.tarih == this.tarih &&
          other.endeks == this.endeks &&
          other.okuyanKisi == this.okuyanKisi &&
          other.fotoPath == this.fotoPath &&
          other.aciklama == this.aciklama);
}

class EndekslerCompanion extends UpdateCompanion<EndekslerData> {
  final Value<int> id;
  final Value<int> aboneId;
  final Value<String> tarih;
  final Value<double> endeks;
  final Value<String?> okuyanKisi;
  final Value<String?> fotoPath;
  final Value<String?> aciklama;
  const EndekslerCompanion({
    this.id = const Value.absent(),
    this.aboneId = const Value.absent(),
    this.tarih = const Value.absent(),
    this.endeks = const Value.absent(),
    this.okuyanKisi = const Value.absent(),
    this.fotoPath = const Value.absent(),
    this.aciklama = const Value.absent(),
  });
  EndekslerCompanion.insert({
    this.id = const Value.absent(),
    required int aboneId,
    required String tarih,
    required double endeks,
    this.okuyanKisi = const Value.absent(),
    this.fotoPath = const Value.absent(),
    this.aciklama = const Value.absent(),
  }) : aboneId = Value(aboneId),
       tarih = Value(tarih),
       endeks = Value(endeks);
  static Insertable<EndekslerData> custom({
    Expression<int>? id,
    Expression<int>? aboneId,
    Expression<String>? tarih,
    Expression<double>? endeks,
    Expression<String>? okuyanKisi,
    Expression<String>? fotoPath,
    Expression<String>? aciklama,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aboneId != null) 'abone_id': aboneId,
      if (tarih != null) 'tarih': tarih,
      if (endeks != null) 'endeks': endeks,
      if (okuyanKisi != null) 'okuyan_kisi': okuyanKisi,
      if (fotoPath != null) 'foto_path': fotoPath,
      if (aciklama != null) 'aciklama': aciklama,
    });
  }

  EndekslerCompanion copyWith({
    Value<int>? id,
    Value<int>? aboneId,
    Value<String>? tarih,
    Value<double>? endeks,
    Value<String?>? okuyanKisi,
    Value<String?>? fotoPath,
    Value<String?>? aciklama,
  }) {
    return EndekslerCompanion(
      id: id ?? this.id,
      aboneId: aboneId ?? this.aboneId,
      tarih: tarih ?? this.tarih,
      endeks: endeks ?? this.endeks,
      okuyanKisi: okuyanKisi ?? this.okuyanKisi,
      fotoPath: fotoPath ?? this.fotoPath,
      aciklama: aciklama ?? this.aciklama,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (aboneId.present) {
      map['abone_id'] = Variable<int>(aboneId.value);
    }
    if (tarih.present) {
      map['tarih'] = Variable<String>(tarih.value);
    }
    if (endeks.present) {
      map['endeks'] = Variable<double>(endeks.value);
    }
    if (okuyanKisi.present) {
      map['okuyan_kisi'] = Variable<String>(okuyanKisi.value);
    }
    if (fotoPath.present) {
      map['foto_path'] = Variable<String>(fotoPath.value);
    }
    if (aciklama.present) {
      map['aciklama'] = Variable<String>(aciklama.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EndekslerCompanion(')
          ..write('id: $id, ')
          ..write('aboneId: $aboneId, ')
          ..write('tarih: $tarih, ')
          ..write('endeks: $endeks, ')
          ..write('okuyanKisi: $okuyanKisi, ')
          ..write('fotoPath: $fotoPath, ')
          ..write('aciklama: $aciklama')
          ..write(')'))
        .toString();
  }
}

class $TahakkuklarTable extends Tahakkuklar
    with TableInfo<$TahakkuklarTable, TahakkuklarData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TahakkuklarTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _aboneIdMeta = const VerificationMeta(
    'aboneId',
  );
  @override
  late final GeneratedColumn<int> aboneId = GeneratedColumn<int>(
    'abone_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES aboneler (id)',
    ),
  );
  static const VerificationMeta _donemIdMeta = const VerificationMeta(
    'donemId',
  );
  @override
  late final GeneratedColumn<int> donemId = GeneratedColumn<int>(
    'donem_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES donemler (id)',
    ),
  );
  static const VerificationMeta _ilkEndeksIdMeta = const VerificationMeta(
    'ilkEndeksId',
  );
  @override
  late final GeneratedColumn<int> ilkEndeksId = GeneratedColumn<int>(
    'ilk_endeks_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES endeksler (id)',
    ),
  );
  static const VerificationMeta _sonEndeksIdMeta = const VerificationMeta(
    'sonEndeksId',
  );
  @override
  late final GeneratedColumn<int> sonEndeksId = GeneratedColumn<int>(
    'son_endeks_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES endeksler (id)',
    ),
  );
  static const VerificationMeta _ilkEndeksMeta = const VerificationMeta(
    'ilkEndeks',
  );
  @override
  late final GeneratedColumn<double> ilkEndeks = GeneratedColumn<double>(
    'ilk_endeks',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sonEndeksMeta = const VerificationMeta(
    'sonEndeks',
  );
  @override
  late final GeneratedColumn<double> sonEndeks = GeneratedColumn<double>(
    'son_endeks',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tuketimM3Meta = const VerificationMeta(
    'tuketimM3',
  );
  @override
  late final GeneratedColumn<double> tuketimM3 = GeneratedColumn<double>(
    'tuketim_m3',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birimFiyatMeta = const VerificationMeta(
    'birimFiyat',
  );
  @override
  late final GeneratedColumn<double> birimFiyat = GeneratedColumn<double>(
    'birim_fiyat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tutarMeta = const VerificationMeta('tutar');
  @override
  late final GeneratedColumn<double> tutar = GeneratedColumn<double>(
    'tutar',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _olusturmaTarihiMeta = const VerificationMeta(
    'olusturmaTarihi',
  );
  @override
  late final GeneratedColumn<String> olusturmaTarihi = GeneratedColumn<String>(
    'olusturma_tarihi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durumMeta = const VerificationMeta('durum');
  @override
  late final GeneratedColumn<String> durum = GeneratedColumn<String>(
    'durum',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('beklemede'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    aboneId,
    donemId,
    ilkEndeksId,
    sonEndeksId,
    ilkEndeks,
    sonEndeks,
    tuketimM3,
    birimFiyat,
    tutar,
    olusturmaTarihi,
    durum,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tahakkuklar';
  @override
  VerificationContext validateIntegrity(
    Insertable<TahakkuklarData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('abone_id')) {
      context.handle(
        _aboneIdMeta,
        aboneId.isAcceptableOrUnknown(data['abone_id']!, _aboneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_aboneIdMeta);
    }
    if (data.containsKey('donem_id')) {
      context.handle(
        _donemIdMeta,
        donemId.isAcceptableOrUnknown(data['donem_id']!, _donemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_donemIdMeta);
    }
    if (data.containsKey('ilk_endeks_id')) {
      context.handle(
        _ilkEndeksIdMeta,
        ilkEndeksId.isAcceptableOrUnknown(
          data['ilk_endeks_id']!,
          _ilkEndeksIdMeta,
        ),
      );
    }
    if (data.containsKey('son_endeks_id')) {
      context.handle(
        _sonEndeksIdMeta,
        sonEndeksId.isAcceptableOrUnknown(
          data['son_endeks_id']!,
          _sonEndeksIdMeta,
        ),
      );
    }
    if (data.containsKey('ilk_endeks')) {
      context.handle(
        _ilkEndeksMeta,
        ilkEndeks.isAcceptableOrUnknown(data['ilk_endeks']!, _ilkEndeksMeta),
      );
    }
    if (data.containsKey('son_endeks')) {
      context.handle(
        _sonEndeksMeta,
        sonEndeks.isAcceptableOrUnknown(data['son_endeks']!, _sonEndeksMeta),
      );
    }
    if (data.containsKey('tuketim_m3')) {
      context.handle(
        _tuketimM3Meta,
        tuketimM3.isAcceptableOrUnknown(data['tuketim_m3']!, _tuketimM3Meta),
      );
    }
    if (data.containsKey('birim_fiyat')) {
      context.handle(
        _birimFiyatMeta,
        birimFiyat.isAcceptableOrUnknown(data['birim_fiyat']!, _birimFiyatMeta),
      );
    } else if (isInserting) {
      context.missing(_birimFiyatMeta);
    }
    if (data.containsKey('tutar')) {
      context.handle(
        _tutarMeta,
        tutar.isAcceptableOrUnknown(data['tutar']!, _tutarMeta),
      );
    } else if (isInserting) {
      context.missing(_tutarMeta);
    }
    if (data.containsKey('olusturma_tarihi')) {
      context.handle(
        _olusturmaTarihiMeta,
        olusturmaTarihi.isAcceptableOrUnknown(
          data['olusturma_tarihi']!,
          _olusturmaTarihiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_olusturmaTarihiMeta);
    }
    if (data.containsKey('durum')) {
      context.handle(
        _durumMeta,
        durum.isAcceptableOrUnknown(data['durum']!, _durumMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TahakkuklarData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TahakkuklarData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      aboneId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}abone_id'],
      )!,
      donemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}donem_id'],
      )!,
      ilkEndeksId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ilk_endeks_id'],
      ),
      sonEndeksId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}son_endeks_id'],
      ),
      ilkEndeks: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ilk_endeks'],
      ),
      sonEndeks: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}son_endeks'],
      ),
      tuketimM3: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tuketim_m3'],
      ),
      birimFiyat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}birim_fiyat'],
      )!,
      tutar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tutar'],
      )!,
      olusturmaTarihi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}olusturma_tarihi'],
      )!,
      durum: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}durum'],
      )!,
    );
  }

  @override
  $TahakkuklarTable createAlias(String alias) {
    return $TahakkuklarTable(attachedDatabase, alias);
  }
}

class TahakkuklarData extends DataClass implements Insertable<TahakkuklarData> {
  final int id;
  final String uuid;
  final int aboneId;
  final int donemId;
  final int? ilkEndeksId;
  final int? sonEndeksId;
  final double? ilkEndeks;
  final double? sonEndeks;
  final double? tuketimM3;
  final double birimFiyat;
  final double tutar;
  final String olusturmaTarihi;
  final String durum;
  const TahakkuklarData({
    required this.id,
    required this.uuid,
    required this.aboneId,
    required this.donemId,
    this.ilkEndeksId,
    this.sonEndeksId,
    this.ilkEndeks,
    this.sonEndeks,
    this.tuketimM3,
    required this.birimFiyat,
    required this.tutar,
    required this.olusturmaTarihi,
    required this.durum,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['abone_id'] = Variable<int>(aboneId);
    map['donem_id'] = Variable<int>(donemId);
    if (!nullToAbsent || ilkEndeksId != null) {
      map['ilk_endeks_id'] = Variable<int>(ilkEndeksId);
    }
    if (!nullToAbsent || sonEndeksId != null) {
      map['son_endeks_id'] = Variable<int>(sonEndeksId);
    }
    if (!nullToAbsent || ilkEndeks != null) {
      map['ilk_endeks'] = Variable<double>(ilkEndeks);
    }
    if (!nullToAbsent || sonEndeks != null) {
      map['son_endeks'] = Variable<double>(sonEndeks);
    }
    if (!nullToAbsent || tuketimM3 != null) {
      map['tuketim_m3'] = Variable<double>(tuketimM3);
    }
    map['birim_fiyat'] = Variable<double>(birimFiyat);
    map['tutar'] = Variable<double>(tutar);
    map['olusturma_tarihi'] = Variable<String>(olusturmaTarihi);
    map['durum'] = Variable<String>(durum);
    return map;
  }

  TahakkuklarCompanion toCompanion(bool nullToAbsent) {
    return TahakkuklarCompanion(
      id: Value(id),
      uuid: Value(uuid),
      aboneId: Value(aboneId),
      donemId: Value(donemId),
      ilkEndeksId: ilkEndeksId == null && nullToAbsent
          ? const Value.absent()
          : Value(ilkEndeksId),
      sonEndeksId: sonEndeksId == null && nullToAbsent
          ? const Value.absent()
          : Value(sonEndeksId),
      ilkEndeks: ilkEndeks == null && nullToAbsent
          ? const Value.absent()
          : Value(ilkEndeks),
      sonEndeks: sonEndeks == null && nullToAbsent
          ? const Value.absent()
          : Value(sonEndeks),
      tuketimM3: tuketimM3 == null && nullToAbsent
          ? const Value.absent()
          : Value(tuketimM3),
      birimFiyat: Value(birimFiyat),
      tutar: Value(tutar),
      olusturmaTarihi: Value(olusturmaTarihi),
      durum: Value(durum),
    );
  }

  factory TahakkuklarData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TahakkuklarData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      aboneId: serializer.fromJson<int>(json['aboneId']),
      donemId: serializer.fromJson<int>(json['donemId']),
      ilkEndeksId: serializer.fromJson<int?>(json['ilkEndeksId']),
      sonEndeksId: serializer.fromJson<int?>(json['sonEndeksId']),
      ilkEndeks: serializer.fromJson<double?>(json['ilkEndeks']),
      sonEndeks: serializer.fromJson<double?>(json['sonEndeks']),
      tuketimM3: serializer.fromJson<double?>(json['tuketimM3']),
      birimFiyat: serializer.fromJson<double>(json['birimFiyat']),
      tutar: serializer.fromJson<double>(json['tutar']),
      olusturmaTarihi: serializer.fromJson<String>(json['olusturmaTarihi']),
      durum: serializer.fromJson<String>(json['durum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'aboneId': serializer.toJson<int>(aboneId),
      'donemId': serializer.toJson<int>(donemId),
      'ilkEndeksId': serializer.toJson<int?>(ilkEndeksId),
      'sonEndeksId': serializer.toJson<int?>(sonEndeksId),
      'ilkEndeks': serializer.toJson<double?>(ilkEndeks),
      'sonEndeks': serializer.toJson<double?>(sonEndeks),
      'tuketimM3': serializer.toJson<double?>(tuketimM3),
      'birimFiyat': serializer.toJson<double>(birimFiyat),
      'tutar': serializer.toJson<double>(tutar),
      'olusturmaTarihi': serializer.toJson<String>(olusturmaTarihi),
      'durum': serializer.toJson<String>(durum),
    };
  }

  TahakkuklarData copyWith({
    int? id,
    String? uuid,
    int? aboneId,
    int? donemId,
    Value<int?> ilkEndeksId = const Value.absent(),
    Value<int?> sonEndeksId = const Value.absent(),
    Value<double?> ilkEndeks = const Value.absent(),
    Value<double?> sonEndeks = const Value.absent(),
    Value<double?> tuketimM3 = const Value.absent(),
    double? birimFiyat,
    double? tutar,
    String? olusturmaTarihi,
    String? durum,
  }) => TahakkuklarData(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    aboneId: aboneId ?? this.aboneId,
    donemId: donemId ?? this.donemId,
    ilkEndeksId: ilkEndeksId.present ? ilkEndeksId.value : this.ilkEndeksId,
    sonEndeksId: sonEndeksId.present ? sonEndeksId.value : this.sonEndeksId,
    ilkEndeks: ilkEndeks.present ? ilkEndeks.value : this.ilkEndeks,
    sonEndeks: sonEndeks.present ? sonEndeks.value : this.sonEndeks,
    tuketimM3: tuketimM3.present ? tuketimM3.value : this.tuketimM3,
    birimFiyat: birimFiyat ?? this.birimFiyat,
    tutar: tutar ?? this.tutar,
    olusturmaTarihi: olusturmaTarihi ?? this.olusturmaTarihi,
    durum: durum ?? this.durum,
  );
  TahakkuklarData copyWithCompanion(TahakkuklarCompanion data) {
    return TahakkuklarData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      aboneId: data.aboneId.present ? data.aboneId.value : this.aboneId,
      donemId: data.donemId.present ? data.donemId.value : this.donemId,
      ilkEndeksId: data.ilkEndeksId.present
          ? data.ilkEndeksId.value
          : this.ilkEndeksId,
      sonEndeksId: data.sonEndeksId.present
          ? data.sonEndeksId.value
          : this.sonEndeksId,
      ilkEndeks: data.ilkEndeks.present ? data.ilkEndeks.value : this.ilkEndeks,
      sonEndeks: data.sonEndeks.present ? data.sonEndeks.value : this.sonEndeks,
      tuketimM3: data.tuketimM3.present ? data.tuketimM3.value : this.tuketimM3,
      birimFiyat: data.birimFiyat.present
          ? data.birimFiyat.value
          : this.birimFiyat,
      tutar: data.tutar.present ? data.tutar.value : this.tutar,
      olusturmaTarihi: data.olusturmaTarihi.present
          ? data.olusturmaTarihi.value
          : this.olusturmaTarihi,
      durum: data.durum.present ? data.durum.value : this.durum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TahakkuklarData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('aboneId: $aboneId, ')
          ..write('donemId: $donemId, ')
          ..write('ilkEndeksId: $ilkEndeksId, ')
          ..write('sonEndeksId: $sonEndeksId, ')
          ..write('ilkEndeks: $ilkEndeks, ')
          ..write('sonEndeks: $sonEndeks, ')
          ..write('tuketimM3: $tuketimM3, ')
          ..write('birimFiyat: $birimFiyat, ')
          ..write('tutar: $tutar, ')
          ..write('olusturmaTarihi: $olusturmaTarihi, ')
          ..write('durum: $durum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    aboneId,
    donemId,
    ilkEndeksId,
    sonEndeksId,
    ilkEndeks,
    sonEndeks,
    tuketimM3,
    birimFiyat,
    tutar,
    olusturmaTarihi,
    durum,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TahakkuklarData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.aboneId == this.aboneId &&
          other.donemId == this.donemId &&
          other.ilkEndeksId == this.ilkEndeksId &&
          other.sonEndeksId == this.sonEndeksId &&
          other.ilkEndeks == this.ilkEndeks &&
          other.sonEndeks == this.sonEndeks &&
          other.tuketimM3 == this.tuketimM3 &&
          other.birimFiyat == this.birimFiyat &&
          other.tutar == this.tutar &&
          other.olusturmaTarihi == this.olusturmaTarihi &&
          other.durum == this.durum);
}

class TahakkuklarCompanion extends UpdateCompanion<TahakkuklarData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<int> aboneId;
  final Value<int> donemId;
  final Value<int?> ilkEndeksId;
  final Value<int?> sonEndeksId;
  final Value<double?> ilkEndeks;
  final Value<double?> sonEndeks;
  final Value<double?> tuketimM3;
  final Value<double> birimFiyat;
  final Value<double> tutar;
  final Value<String> olusturmaTarihi;
  final Value<String> durum;
  const TahakkuklarCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.aboneId = const Value.absent(),
    this.donemId = const Value.absent(),
    this.ilkEndeksId = const Value.absent(),
    this.sonEndeksId = const Value.absent(),
    this.ilkEndeks = const Value.absent(),
    this.sonEndeks = const Value.absent(),
    this.tuketimM3 = const Value.absent(),
    this.birimFiyat = const Value.absent(),
    this.tutar = const Value.absent(),
    this.olusturmaTarihi = const Value.absent(),
    this.durum = const Value.absent(),
  });
  TahakkuklarCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required int aboneId,
    required int donemId,
    this.ilkEndeksId = const Value.absent(),
    this.sonEndeksId = const Value.absent(),
    this.ilkEndeks = const Value.absent(),
    this.sonEndeks = const Value.absent(),
    this.tuketimM3 = const Value.absent(),
    required double birimFiyat,
    required double tutar,
    required String olusturmaTarihi,
    this.durum = const Value.absent(),
  }) : aboneId = Value(aboneId),
       donemId = Value(donemId),
       birimFiyat = Value(birimFiyat),
       tutar = Value(tutar),
       olusturmaTarihi = Value(olusturmaTarihi);
  static Insertable<TahakkuklarData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<int>? aboneId,
    Expression<int>? donemId,
    Expression<int>? ilkEndeksId,
    Expression<int>? sonEndeksId,
    Expression<double>? ilkEndeks,
    Expression<double>? sonEndeks,
    Expression<double>? tuketimM3,
    Expression<double>? birimFiyat,
    Expression<double>? tutar,
    Expression<String>? olusturmaTarihi,
    Expression<String>? durum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (aboneId != null) 'abone_id': aboneId,
      if (donemId != null) 'donem_id': donemId,
      if (ilkEndeksId != null) 'ilk_endeks_id': ilkEndeksId,
      if (sonEndeksId != null) 'son_endeks_id': sonEndeksId,
      if (ilkEndeks != null) 'ilk_endeks': ilkEndeks,
      if (sonEndeks != null) 'son_endeks': sonEndeks,
      if (tuketimM3 != null) 'tuketim_m3': tuketimM3,
      if (birimFiyat != null) 'birim_fiyat': birimFiyat,
      if (tutar != null) 'tutar': tutar,
      if (olusturmaTarihi != null) 'olusturma_tarihi': olusturmaTarihi,
      if (durum != null) 'durum': durum,
    });
  }

  TahakkuklarCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<int>? aboneId,
    Value<int>? donemId,
    Value<int?>? ilkEndeksId,
    Value<int?>? sonEndeksId,
    Value<double?>? ilkEndeks,
    Value<double?>? sonEndeks,
    Value<double?>? tuketimM3,
    Value<double>? birimFiyat,
    Value<double>? tutar,
    Value<String>? olusturmaTarihi,
    Value<String>? durum,
  }) {
    return TahakkuklarCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      aboneId: aboneId ?? this.aboneId,
      donemId: donemId ?? this.donemId,
      ilkEndeksId: ilkEndeksId ?? this.ilkEndeksId,
      sonEndeksId: sonEndeksId ?? this.sonEndeksId,
      ilkEndeks: ilkEndeks ?? this.ilkEndeks,
      sonEndeks: sonEndeks ?? this.sonEndeks,
      tuketimM3: tuketimM3 ?? this.tuketimM3,
      birimFiyat: birimFiyat ?? this.birimFiyat,
      tutar: tutar ?? this.tutar,
      olusturmaTarihi: olusturmaTarihi ?? this.olusturmaTarihi,
      durum: durum ?? this.durum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (aboneId.present) {
      map['abone_id'] = Variable<int>(aboneId.value);
    }
    if (donemId.present) {
      map['donem_id'] = Variable<int>(donemId.value);
    }
    if (ilkEndeksId.present) {
      map['ilk_endeks_id'] = Variable<int>(ilkEndeksId.value);
    }
    if (sonEndeksId.present) {
      map['son_endeks_id'] = Variable<int>(sonEndeksId.value);
    }
    if (ilkEndeks.present) {
      map['ilk_endeks'] = Variable<double>(ilkEndeks.value);
    }
    if (sonEndeks.present) {
      map['son_endeks'] = Variable<double>(sonEndeks.value);
    }
    if (tuketimM3.present) {
      map['tuketim_m3'] = Variable<double>(tuketimM3.value);
    }
    if (birimFiyat.present) {
      map['birim_fiyat'] = Variable<double>(birimFiyat.value);
    }
    if (tutar.present) {
      map['tutar'] = Variable<double>(tutar.value);
    }
    if (olusturmaTarihi.present) {
      map['olusturma_tarihi'] = Variable<String>(olusturmaTarihi.value);
    }
    if (durum.present) {
      map['durum'] = Variable<String>(durum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TahakkuklarCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('aboneId: $aboneId, ')
          ..write('donemId: $donemId, ')
          ..write('ilkEndeksId: $ilkEndeksId, ')
          ..write('sonEndeksId: $sonEndeksId, ')
          ..write('ilkEndeks: $ilkEndeks, ')
          ..write('sonEndeks: $sonEndeks, ')
          ..write('tuketimM3: $tuketimM3, ')
          ..write('birimFiyat: $birimFiyat, ')
          ..write('tutar: $tutar, ')
          ..write('olusturmaTarihi: $olusturmaTarihi, ')
          ..write('durum: $durum')
          ..write(')'))
        .toString();
  }
}

class $TahsilatlarTable extends Tahsilatlar
    with TableInfo<$TahsilatlarTable, TahsilatlarData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TahsilatlarTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tahakkukIdMeta = const VerificationMeta(
    'tahakkukId',
  );
  @override
  late final GeneratedColumn<int> tahakkukId = GeneratedColumn<int>(
    'tahakkuk_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tahakkuklar (id)',
    ),
  );
  static const VerificationMeta _tarihMeta = const VerificationMeta('tarih');
  @override
  late final GeneratedColumn<String> tarih = GeneratedColumn<String>(
    'tarih',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tutarMeta = const VerificationMeta('tutar');
  @override
  late final GeneratedColumn<double> tutar = GeneratedColumn<double>(
    'tutar',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _odemeTipiMeta = const VerificationMeta(
    'odemeTipi',
  );
  @override
  late final GeneratedColumn<String> odemeTipi = GeneratedColumn<String>(
    'odeme_tipi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aciklamaMeta = const VerificationMeta(
    'aciklama',
  );
  @override
  late final GeneratedColumn<String> aciklama = GeneratedColumn<String>(
    'aciklama',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tahakkukId,
    tarih,
    tutar,
    odemeTipi,
    aciklama,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tahsilatlar';
  @override
  VerificationContext validateIntegrity(
    Insertable<TahsilatlarData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tahakkuk_id')) {
      context.handle(
        _tahakkukIdMeta,
        tahakkukId.isAcceptableOrUnknown(data['tahakkuk_id']!, _tahakkukIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tahakkukIdMeta);
    }
    if (data.containsKey('tarih')) {
      context.handle(
        _tarihMeta,
        tarih.isAcceptableOrUnknown(data['tarih']!, _tarihMeta),
      );
    } else if (isInserting) {
      context.missing(_tarihMeta);
    }
    if (data.containsKey('tutar')) {
      context.handle(
        _tutarMeta,
        tutar.isAcceptableOrUnknown(data['tutar']!, _tutarMeta),
      );
    } else if (isInserting) {
      context.missing(_tutarMeta);
    }
    if (data.containsKey('odeme_tipi')) {
      context.handle(
        _odemeTipiMeta,
        odemeTipi.isAcceptableOrUnknown(data['odeme_tipi']!, _odemeTipiMeta),
      );
    }
    if (data.containsKey('aciklama')) {
      context.handle(
        _aciklamaMeta,
        aciklama.isAcceptableOrUnknown(data['aciklama']!, _aciklamaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TahsilatlarData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TahsilatlarData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tahakkukId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tahakkuk_id'],
      )!,
      tarih: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tarih'],
      )!,
      tutar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tutar'],
      )!,
      odemeTipi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}odeme_tipi'],
      ),
      aciklama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aciklama'],
      ),
    );
  }

  @override
  $TahsilatlarTable createAlias(String alias) {
    return $TahsilatlarTable(attachedDatabase, alias);
  }
}

class TahsilatlarData extends DataClass implements Insertable<TahsilatlarData> {
  final int id;
  final int tahakkukId;
  final String tarih;
  final double tutar;
  final String? odemeTipi;
  final String? aciklama;
  const TahsilatlarData({
    required this.id,
    required this.tahakkukId,
    required this.tarih,
    required this.tutar,
    this.odemeTipi,
    this.aciklama,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tahakkuk_id'] = Variable<int>(tahakkukId);
    map['tarih'] = Variable<String>(tarih);
    map['tutar'] = Variable<double>(tutar);
    if (!nullToAbsent || odemeTipi != null) {
      map['odeme_tipi'] = Variable<String>(odemeTipi);
    }
    if (!nullToAbsent || aciklama != null) {
      map['aciklama'] = Variable<String>(aciklama);
    }
    return map;
  }

  TahsilatlarCompanion toCompanion(bool nullToAbsent) {
    return TahsilatlarCompanion(
      id: Value(id),
      tahakkukId: Value(tahakkukId),
      tarih: Value(tarih),
      tutar: Value(tutar),
      odemeTipi: odemeTipi == null && nullToAbsent
          ? const Value.absent()
          : Value(odemeTipi),
      aciklama: aciklama == null && nullToAbsent
          ? const Value.absent()
          : Value(aciklama),
    );
  }

  factory TahsilatlarData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TahsilatlarData(
      id: serializer.fromJson<int>(json['id']),
      tahakkukId: serializer.fromJson<int>(json['tahakkukId']),
      tarih: serializer.fromJson<String>(json['tarih']),
      tutar: serializer.fromJson<double>(json['tutar']),
      odemeTipi: serializer.fromJson<String?>(json['odemeTipi']),
      aciklama: serializer.fromJson<String?>(json['aciklama']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tahakkukId': serializer.toJson<int>(tahakkukId),
      'tarih': serializer.toJson<String>(tarih),
      'tutar': serializer.toJson<double>(tutar),
      'odemeTipi': serializer.toJson<String?>(odemeTipi),
      'aciklama': serializer.toJson<String?>(aciklama),
    };
  }

  TahsilatlarData copyWith({
    int? id,
    int? tahakkukId,
    String? tarih,
    double? tutar,
    Value<String?> odemeTipi = const Value.absent(),
    Value<String?> aciklama = const Value.absent(),
  }) => TahsilatlarData(
    id: id ?? this.id,
    tahakkukId: tahakkukId ?? this.tahakkukId,
    tarih: tarih ?? this.tarih,
    tutar: tutar ?? this.tutar,
    odemeTipi: odemeTipi.present ? odemeTipi.value : this.odemeTipi,
    aciklama: aciklama.present ? aciklama.value : this.aciklama,
  );
  TahsilatlarData copyWithCompanion(TahsilatlarCompanion data) {
    return TahsilatlarData(
      id: data.id.present ? data.id.value : this.id,
      tahakkukId: data.tahakkukId.present
          ? data.tahakkukId.value
          : this.tahakkukId,
      tarih: data.tarih.present ? data.tarih.value : this.tarih,
      tutar: data.tutar.present ? data.tutar.value : this.tutar,
      odemeTipi: data.odemeTipi.present ? data.odemeTipi.value : this.odemeTipi,
      aciklama: data.aciklama.present ? data.aciklama.value : this.aciklama,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TahsilatlarData(')
          ..write('id: $id, ')
          ..write('tahakkukId: $tahakkukId, ')
          ..write('tarih: $tarih, ')
          ..write('tutar: $tutar, ')
          ..write('odemeTipi: $odemeTipi, ')
          ..write('aciklama: $aciklama')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, tahakkukId, tarih, tutar, odemeTipi, aciklama);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TahsilatlarData &&
          other.id == this.id &&
          other.tahakkukId == this.tahakkukId &&
          other.tarih == this.tarih &&
          other.tutar == this.tutar &&
          other.odemeTipi == this.odemeTipi &&
          other.aciklama == this.aciklama);
}

class TahsilatlarCompanion extends UpdateCompanion<TahsilatlarData> {
  final Value<int> id;
  final Value<int> tahakkukId;
  final Value<String> tarih;
  final Value<double> tutar;
  final Value<String?> odemeTipi;
  final Value<String?> aciklama;
  const TahsilatlarCompanion({
    this.id = const Value.absent(),
    this.tahakkukId = const Value.absent(),
    this.tarih = const Value.absent(),
    this.tutar = const Value.absent(),
    this.odemeTipi = const Value.absent(),
    this.aciklama = const Value.absent(),
  });
  TahsilatlarCompanion.insert({
    this.id = const Value.absent(),
    required int tahakkukId,
    required String tarih,
    required double tutar,
    this.odemeTipi = const Value.absent(),
    this.aciklama = const Value.absent(),
  }) : tahakkukId = Value(tahakkukId),
       tarih = Value(tarih),
       tutar = Value(tutar);
  static Insertable<TahsilatlarData> custom({
    Expression<int>? id,
    Expression<int>? tahakkukId,
    Expression<String>? tarih,
    Expression<double>? tutar,
    Expression<String>? odemeTipi,
    Expression<String>? aciklama,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tahakkukId != null) 'tahakkuk_id': tahakkukId,
      if (tarih != null) 'tarih': tarih,
      if (tutar != null) 'tutar': tutar,
      if (odemeTipi != null) 'odeme_tipi': odemeTipi,
      if (aciklama != null) 'aciklama': aciklama,
    });
  }

  TahsilatlarCompanion copyWith({
    Value<int>? id,
    Value<int>? tahakkukId,
    Value<String>? tarih,
    Value<double>? tutar,
    Value<String?>? odemeTipi,
    Value<String?>? aciklama,
  }) {
    return TahsilatlarCompanion(
      id: id ?? this.id,
      tahakkukId: tahakkukId ?? this.tahakkukId,
      tarih: tarih ?? this.tarih,
      tutar: tutar ?? this.tutar,
      odemeTipi: odemeTipi ?? this.odemeTipi,
      aciklama: aciklama ?? this.aciklama,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tahakkukId.present) {
      map['tahakkuk_id'] = Variable<int>(tahakkukId.value);
    }
    if (tarih.present) {
      map['tarih'] = Variable<String>(tarih.value);
    }
    if (tutar.present) {
      map['tutar'] = Variable<double>(tutar.value);
    }
    if (odemeTipi.present) {
      map['odeme_tipi'] = Variable<String>(odemeTipi.value);
    }
    if (aciklama.present) {
      map['aciklama'] = Variable<String>(aciklama.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TahsilatlarCompanion(')
          ..write('id: $id, ')
          ..write('tahakkukId: $tahakkukId, ')
          ..write('tarih: $tarih, ')
          ..write('tutar: $tutar, ')
          ..write('odemeTipi: $odemeTipi, ')
          ..write('aciklama: $aciklama')
          ..write(')'))
        .toString();
  }
}

class $SayaclarTable extends Sayaclar
    with TableInfo<$SayaclarTable, SayaclarData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SayaclarTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _aboneIdMeta = const VerificationMeta(
    'aboneId',
  );
  @override
  late final GeneratedColumn<int> aboneId = GeneratedColumn<int>(
    'abone_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES aboneler (id)',
    ),
  );
  static const VerificationMeta _saatNoMeta = const VerificationMeta('saatNo');
  @override
  late final GeneratedColumn<String> saatNo = GeneratedColumn<String>(
    'saat_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baslangicEndeksMeta = const VerificationMeta(
    'baslangicEndeks',
  );
  @override
  late final GeneratedColumn<double> baslangicEndeks = GeneratedColumn<double>(
    'baslangic_endeks',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baslangicTarihiMeta = const VerificationMeta(
    'baslangicTarihi',
  );
  @override
  late final GeneratedColumn<String> baslangicTarihi = GeneratedColumn<String>(
    'baslangic_tarihi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bitisEndeksMeta = const VerificationMeta(
    'bitisEndeks',
  );
  @override
  late final GeneratedColumn<double> bitisEndeks = GeneratedColumn<double>(
    'bitis_endeks',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bitisTarihiMeta = const VerificationMeta(
    'bitisTarihi',
  );
  @override
  late final GeneratedColumn<String> bitisTarihi = GeneratedColumn<String>(
    'bitis_tarihi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aktifMeta = const VerificationMeta('aktif');
  @override
  late final GeneratedColumn<int> aktif = GeneratedColumn<int>(
    'aktif',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _aciklamaMeta = const VerificationMeta(
    'aciklama',
  );
  @override
  late final GeneratedColumn<String> aciklama = GeneratedColumn<String>(
    'aciklama',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    aboneId,
    saatNo,
    baslangicEndeks,
    baslangicTarihi,
    bitisEndeks,
    bitisTarihi,
    aktif,
    aciklama,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sayaclar';
  @override
  VerificationContext validateIntegrity(
    Insertable<SayaclarData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('abone_id')) {
      context.handle(
        _aboneIdMeta,
        aboneId.isAcceptableOrUnknown(data['abone_id']!, _aboneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_aboneIdMeta);
    }
    if (data.containsKey('saat_no')) {
      context.handle(
        _saatNoMeta,
        saatNo.isAcceptableOrUnknown(data['saat_no']!, _saatNoMeta),
      );
    } else if (isInserting) {
      context.missing(_saatNoMeta);
    }
    if (data.containsKey('baslangic_endeks')) {
      context.handle(
        _baslangicEndeksMeta,
        baslangicEndeks.isAcceptableOrUnknown(
          data['baslangic_endeks']!,
          _baslangicEndeksMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baslangicEndeksMeta);
    }
    if (data.containsKey('baslangic_tarihi')) {
      context.handle(
        _baslangicTarihiMeta,
        baslangicTarihi.isAcceptableOrUnknown(
          data['baslangic_tarihi']!,
          _baslangicTarihiMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baslangicTarihiMeta);
    }
    if (data.containsKey('bitis_endeks')) {
      context.handle(
        _bitisEndeksMeta,
        bitisEndeks.isAcceptableOrUnknown(
          data['bitis_endeks']!,
          _bitisEndeksMeta,
        ),
      );
    }
    if (data.containsKey('bitis_tarihi')) {
      context.handle(
        _bitisTarihiMeta,
        bitisTarihi.isAcceptableOrUnknown(
          data['bitis_tarihi']!,
          _bitisTarihiMeta,
        ),
      );
    }
    if (data.containsKey('aktif')) {
      context.handle(
        _aktifMeta,
        aktif.isAcceptableOrUnknown(data['aktif']!, _aktifMeta),
      );
    }
    if (data.containsKey('aciklama')) {
      context.handle(
        _aciklamaMeta,
        aciklama.isAcceptableOrUnknown(data['aciklama']!, _aciklamaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SayaclarData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SayaclarData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      aboneId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}abone_id'],
      )!,
      saatNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}saat_no'],
      )!,
      baslangicEndeks: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}baslangic_endeks'],
      )!,
      baslangicTarihi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}baslangic_tarihi'],
      )!,
      bitisEndeks: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bitis_endeks'],
      ),
      bitisTarihi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bitis_tarihi'],
      ),
      aktif: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}aktif'],
      )!,
      aciklama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aciklama'],
      ),
    );
  }

  @override
  $SayaclarTable createAlias(String alias) {
    return $SayaclarTable(attachedDatabase, alias);
  }
}

class SayaclarData extends DataClass implements Insertable<SayaclarData> {
  final int id;
  final int aboneId;
  final String saatNo;
  final double baslangicEndeks;
  final String baslangicTarihi;
  final double? bitisEndeks;
  final String? bitisTarihi;
  final int aktif;
  final String? aciklama;
  const SayaclarData({
    required this.id,
    required this.aboneId,
    required this.saatNo,
    required this.baslangicEndeks,
    required this.baslangicTarihi,
    this.bitisEndeks,
    this.bitisTarihi,
    required this.aktif,
    this.aciklama,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['abone_id'] = Variable<int>(aboneId);
    map['saat_no'] = Variable<String>(saatNo);
    map['baslangic_endeks'] = Variable<double>(baslangicEndeks);
    map['baslangic_tarihi'] = Variable<String>(baslangicTarihi);
    if (!nullToAbsent || bitisEndeks != null) {
      map['bitis_endeks'] = Variable<double>(bitisEndeks);
    }
    if (!nullToAbsent || bitisTarihi != null) {
      map['bitis_tarihi'] = Variable<String>(bitisTarihi);
    }
    map['aktif'] = Variable<int>(aktif);
    if (!nullToAbsent || aciklama != null) {
      map['aciklama'] = Variable<String>(aciklama);
    }
    return map;
  }

  SayaclarCompanion toCompanion(bool nullToAbsent) {
    return SayaclarCompanion(
      id: Value(id),
      aboneId: Value(aboneId),
      saatNo: Value(saatNo),
      baslangicEndeks: Value(baslangicEndeks),
      baslangicTarihi: Value(baslangicTarihi),
      bitisEndeks: bitisEndeks == null && nullToAbsent
          ? const Value.absent()
          : Value(bitisEndeks),
      bitisTarihi: bitisTarihi == null && nullToAbsent
          ? const Value.absent()
          : Value(bitisTarihi),
      aktif: Value(aktif),
      aciklama: aciklama == null && nullToAbsent
          ? const Value.absent()
          : Value(aciklama),
    );
  }

  factory SayaclarData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SayaclarData(
      id: serializer.fromJson<int>(json['id']),
      aboneId: serializer.fromJson<int>(json['aboneId']),
      saatNo: serializer.fromJson<String>(json['saatNo']),
      baslangicEndeks: serializer.fromJson<double>(json['baslangicEndeks']),
      baslangicTarihi: serializer.fromJson<String>(json['baslangicTarihi']),
      bitisEndeks: serializer.fromJson<double?>(json['bitisEndeks']),
      bitisTarihi: serializer.fromJson<String?>(json['bitisTarihi']),
      aktif: serializer.fromJson<int>(json['aktif']),
      aciklama: serializer.fromJson<String?>(json['aciklama']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'aboneId': serializer.toJson<int>(aboneId),
      'saatNo': serializer.toJson<String>(saatNo),
      'baslangicEndeks': serializer.toJson<double>(baslangicEndeks),
      'baslangicTarihi': serializer.toJson<String>(baslangicTarihi),
      'bitisEndeks': serializer.toJson<double?>(bitisEndeks),
      'bitisTarihi': serializer.toJson<String?>(bitisTarihi),
      'aktif': serializer.toJson<int>(aktif),
      'aciklama': serializer.toJson<String?>(aciklama),
    };
  }

  SayaclarData copyWith({
    int? id,
    int? aboneId,
    String? saatNo,
    double? baslangicEndeks,
    String? baslangicTarihi,
    Value<double?> bitisEndeks = const Value.absent(),
    Value<String?> bitisTarihi = const Value.absent(),
    int? aktif,
    Value<String?> aciklama = const Value.absent(),
  }) => SayaclarData(
    id: id ?? this.id,
    aboneId: aboneId ?? this.aboneId,
    saatNo: saatNo ?? this.saatNo,
    baslangicEndeks: baslangicEndeks ?? this.baslangicEndeks,
    baslangicTarihi: baslangicTarihi ?? this.baslangicTarihi,
    bitisEndeks: bitisEndeks.present ? bitisEndeks.value : this.bitisEndeks,
    bitisTarihi: bitisTarihi.present ? bitisTarihi.value : this.bitisTarihi,
    aktif: aktif ?? this.aktif,
    aciklama: aciklama.present ? aciklama.value : this.aciklama,
  );
  SayaclarData copyWithCompanion(SayaclarCompanion data) {
    return SayaclarData(
      id: data.id.present ? data.id.value : this.id,
      aboneId: data.aboneId.present ? data.aboneId.value : this.aboneId,
      saatNo: data.saatNo.present ? data.saatNo.value : this.saatNo,
      baslangicEndeks: data.baslangicEndeks.present
          ? data.baslangicEndeks.value
          : this.baslangicEndeks,
      baslangicTarihi: data.baslangicTarihi.present
          ? data.baslangicTarihi.value
          : this.baslangicTarihi,
      bitisEndeks: data.bitisEndeks.present
          ? data.bitisEndeks.value
          : this.bitisEndeks,
      bitisTarihi: data.bitisTarihi.present
          ? data.bitisTarihi.value
          : this.bitisTarihi,
      aktif: data.aktif.present ? data.aktif.value : this.aktif,
      aciklama: data.aciklama.present ? data.aciklama.value : this.aciklama,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SayaclarData(')
          ..write('id: $id, ')
          ..write('aboneId: $aboneId, ')
          ..write('saatNo: $saatNo, ')
          ..write('baslangicEndeks: $baslangicEndeks, ')
          ..write('baslangicTarihi: $baslangicTarihi, ')
          ..write('bitisEndeks: $bitisEndeks, ')
          ..write('bitisTarihi: $bitisTarihi, ')
          ..write('aktif: $aktif, ')
          ..write('aciklama: $aciklama')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    aboneId,
    saatNo,
    baslangicEndeks,
    baslangicTarihi,
    bitisEndeks,
    bitisTarihi,
    aktif,
    aciklama,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SayaclarData &&
          other.id == this.id &&
          other.aboneId == this.aboneId &&
          other.saatNo == this.saatNo &&
          other.baslangicEndeks == this.baslangicEndeks &&
          other.baslangicTarihi == this.baslangicTarihi &&
          other.bitisEndeks == this.bitisEndeks &&
          other.bitisTarihi == this.bitisTarihi &&
          other.aktif == this.aktif &&
          other.aciklama == this.aciklama);
}

class SayaclarCompanion extends UpdateCompanion<SayaclarData> {
  final Value<int> id;
  final Value<int> aboneId;
  final Value<String> saatNo;
  final Value<double> baslangicEndeks;
  final Value<String> baslangicTarihi;
  final Value<double?> bitisEndeks;
  final Value<String?> bitisTarihi;
  final Value<int> aktif;
  final Value<String?> aciklama;
  const SayaclarCompanion({
    this.id = const Value.absent(),
    this.aboneId = const Value.absent(),
    this.saatNo = const Value.absent(),
    this.baslangicEndeks = const Value.absent(),
    this.baslangicTarihi = const Value.absent(),
    this.bitisEndeks = const Value.absent(),
    this.bitisTarihi = const Value.absent(),
    this.aktif = const Value.absent(),
    this.aciklama = const Value.absent(),
  });
  SayaclarCompanion.insert({
    this.id = const Value.absent(),
    required int aboneId,
    required String saatNo,
    required double baslangicEndeks,
    required String baslangicTarihi,
    this.bitisEndeks = const Value.absent(),
    this.bitisTarihi = const Value.absent(),
    this.aktif = const Value.absent(),
    this.aciklama = const Value.absent(),
  }) : aboneId = Value(aboneId),
       saatNo = Value(saatNo),
       baslangicEndeks = Value(baslangicEndeks),
       baslangicTarihi = Value(baslangicTarihi);
  static Insertable<SayaclarData> custom({
    Expression<int>? id,
    Expression<int>? aboneId,
    Expression<String>? saatNo,
    Expression<double>? baslangicEndeks,
    Expression<String>? baslangicTarihi,
    Expression<double>? bitisEndeks,
    Expression<String>? bitisTarihi,
    Expression<int>? aktif,
    Expression<String>? aciklama,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aboneId != null) 'abone_id': aboneId,
      if (saatNo != null) 'saat_no': saatNo,
      if (baslangicEndeks != null) 'baslangic_endeks': baslangicEndeks,
      if (baslangicTarihi != null) 'baslangic_tarihi': baslangicTarihi,
      if (bitisEndeks != null) 'bitis_endeks': bitisEndeks,
      if (bitisTarihi != null) 'bitis_tarihi': bitisTarihi,
      if (aktif != null) 'aktif': aktif,
      if (aciklama != null) 'aciklama': aciklama,
    });
  }

  SayaclarCompanion copyWith({
    Value<int>? id,
    Value<int>? aboneId,
    Value<String>? saatNo,
    Value<double>? baslangicEndeks,
    Value<String>? baslangicTarihi,
    Value<double?>? bitisEndeks,
    Value<String?>? bitisTarihi,
    Value<int>? aktif,
    Value<String?>? aciklama,
  }) {
    return SayaclarCompanion(
      id: id ?? this.id,
      aboneId: aboneId ?? this.aboneId,
      saatNo: saatNo ?? this.saatNo,
      baslangicEndeks: baslangicEndeks ?? this.baslangicEndeks,
      baslangicTarihi: baslangicTarihi ?? this.baslangicTarihi,
      bitisEndeks: bitisEndeks ?? this.bitisEndeks,
      bitisTarihi: bitisTarihi ?? this.bitisTarihi,
      aktif: aktif ?? this.aktif,
      aciklama: aciklama ?? this.aciklama,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (aboneId.present) {
      map['abone_id'] = Variable<int>(aboneId.value);
    }
    if (saatNo.present) {
      map['saat_no'] = Variable<String>(saatNo.value);
    }
    if (baslangicEndeks.present) {
      map['baslangic_endeks'] = Variable<double>(baslangicEndeks.value);
    }
    if (baslangicTarihi.present) {
      map['baslangic_tarihi'] = Variable<String>(baslangicTarihi.value);
    }
    if (bitisEndeks.present) {
      map['bitis_endeks'] = Variable<double>(bitisEndeks.value);
    }
    if (bitisTarihi.present) {
      map['bitis_tarihi'] = Variable<String>(bitisTarihi.value);
    }
    if (aktif.present) {
      map['aktif'] = Variable<int>(aktif.value);
    }
    if (aciklama.present) {
      map['aciklama'] = Variable<String>(aciklama.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SayaclarCompanion(')
          ..write('id: $id, ')
          ..write('aboneId: $aboneId, ')
          ..write('saatNo: $saatNo, ')
          ..write('baslangicEndeks: $baslangicEndeks, ')
          ..write('baslangicTarihi: $baslangicTarihi, ')
          ..write('bitisEndeks: $bitisEndeks, ')
          ..write('bitisTarihi: $bitisTarihi, ')
          ..write('aktif: $aktif, ')
          ..write('aciklama: $aciklama')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AyarlarTable ayarlar = $AyarlarTable(this);
  late final $DonemlerTable donemler = $DonemlerTable(this);
  late final $AbonelerTable aboneler = $AbonelerTable(this);
  late final $EndekslerTable endeksler = $EndekslerTable(this);
  late final $TahakkuklarTable tahakkuklar = $TahakkuklarTable(this);
  late final $TahsilatlarTable tahsilatlar = $TahsilatlarTable(this);
  late final $SayaclarTable sayaclar = $SayaclarTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    ayarlar,
    donemler,
    aboneler,
    endeksler,
    tahakkuklar,
    tahsilatlar,
    sayaclar,
  ];
}

typedef $$AyarlarTableCreateCompanionBuilder =
    AyarlarCompanion Function({
      Value<int> id,
      Value<String?> kullaniciAdi,
      Value<String?> sifre,
      Value<String?> kullaniciTel,
      Value<double> suM3Fiyat,
      Value<String?> antetBaslik,
      Value<String?> antetAdres,
      Value<String?> altBilgi,
      Value<String?> yaziciBluetoothAd,
      Value<String?> yaziciBluetoothMac,
      Value<int?> varsayilanDonemId,
    });
typedef $$AyarlarTableUpdateCompanionBuilder =
    AyarlarCompanion Function({
      Value<int> id,
      Value<String?> kullaniciAdi,
      Value<String?> sifre,
      Value<String?> kullaniciTel,
      Value<double> suM3Fiyat,
      Value<String?> antetBaslik,
      Value<String?> antetAdres,
      Value<String?> altBilgi,
      Value<String?> yaziciBluetoothAd,
      Value<String?> yaziciBluetoothMac,
      Value<int?> varsayilanDonemId,
    });

class $$AyarlarTableFilterComposer
    extends Composer<_$AppDatabase, $AyarlarTable> {
  $$AyarlarTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kullaniciAdi => $composableBuilder(
    column: $table.kullaniciAdi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sifre => $composableBuilder(
    column: $table.sifre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kullaniciTel => $composableBuilder(
    column: $table.kullaniciTel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get suM3Fiyat => $composableBuilder(
    column: $table.suM3Fiyat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get antetBaslik => $composableBuilder(
    column: $table.antetBaslik,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get antetAdres => $composableBuilder(
    column: $table.antetAdres,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get altBilgi => $composableBuilder(
    column: $table.altBilgi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get yaziciBluetoothAd => $composableBuilder(
    column: $table.yaziciBluetoothAd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get yaziciBluetoothMac => $composableBuilder(
    column: $table.yaziciBluetoothMac,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get varsayilanDonemId => $composableBuilder(
    column: $table.varsayilanDonemId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AyarlarTableOrderingComposer
    extends Composer<_$AppDatabase, $AyarlarTable> {
  $$AyarlarTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kullaniciAdi => $composableBuilder(
    column: $table.kullaniciAdi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sifre => $composableBuilder(
    column: $table.sifre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kullaniciTel => $composableBuilder(
    column: $table.kullaniciTel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get suM3Fiyat => $composableBuilder(
    column: $table.suM3Fiyat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get antetBaslik => $composableBuilder(
    column: $table.antetBaslik,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get antetAdres => $composableBuilder(
    column: $table.antetAdres,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get altBilgi => $composableBuilder(
    column: $table.altBilgi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get yaziciBluetoothAd => $composableBuilder(
    column: $table.yaziciBluetoothAd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get yaziciBluetoothMac => $composableBuilder(
    column: $table.yaziciBluetoothMac,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get varsayilanDonemId => $composableBuilder(
    column: $table.varsayilanDonemId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AyarlarTableAnnotationComposer
    extends Composer<_$AppDatabase, $AyarlarTable> {
  $$AyarlarTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kullaniciAdi => $composableBuilder(
    column: $table.kullaniciAdi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sifre =>
      $composableBuilder(column: $table.sifre, builder: (column) => column);

  GeneratedColumn<String> get kullaniciTel => $composableBuilder(
    column: $table.kullaniciTel,
    builder: (column) => column,
  );

  GeneratedColumn<double> get suM3Fiyat =>
      $composableBuilder(column: $table.suM3Fiyat, builder: (column) => column);

  GeneratedColumn<String> get antetBaslik => $composableBuilder(
    column: $table.antetBaslik,
    builder: (column) => column,
  );

  GeneratedColumn<String> get antetAdres => $composableBuilder(
    column: $table.antetAdres,
    builder: (column) => column,
  );

  GeneratedColumn<String> get altBilgi =>
      $composableBuilder(column: $table.altBilgi, builder: (column) => column);

  GeneratedColumn<String> get yaziciBluetoothAd => $composableBuilder(
    column: $table.yaziciBluetoothAd,
    builder: (column) => column,
  );

  GeneratedColumn<String> get yaziciBluetoothMac => $composableBuilder(
    column: $table.yaziciBluetoothMac,
    builder: (column) => column,
  );

  GeneratedColumn<int> get varsayilanDonemId => $composableBuilder(
    column: $table.varsayilanDonemId,
    builder: (column) => column,
  );
}

class $$AyarlarTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AyarlarTable,
          AyarlarData,
          $$AyarlarTableFilterComposer,
          $$AyarlarTableOrderingComposer,
          $$AyarlarTableAnnotationComposer,
          $$AyarlarTableCreateCompanionBuilder,
          $$AyarlarTableUpdateCompanionBuilder,
          (
            AyarlarData,
            BaseReferences<_$AppDatabase, $AyarlarTable, AyarlarData>,
          ),
          AyarlarData,
          PrefetchHooks Function()
        > {
  $$AyarlarTableTableManager(_$AppDatabase db, $AyarlarTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AyarlarTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AyarlarTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AyarlarTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> kullaniciAdi = const Value.absent(),
                Value<String?> sifre = const Value.absent(),
                Value<String?> kullaniciTel = const Value.absent(),
                Value<double> suM3Fiyat = const Value.absent(),
                Value<String?> antetBaslik = const Value.absent(),
                Value<String?> antetAdres = const Value.absent(),
                Value<String?> altBilgi = const Value.absent(),
                Value<String?> yaziciBluetoothAd = const Value.absent(),
                Value<String?> yaziciBluetoothMac = const Value.absent(),
                Value<int?> varsayilanDonemId = const Value.absent(),
              }) => AyarlarCompanion(
                id: id,
                kullaniciAdi: kullaniciAdi,
                sifre: sifre,
                kullaniciTel: kullaniciTel,
                suM3Fiyat: suM3Fiyat,
                antetBaslik: antetBaslik,
                antetAdres: antetAdres,
                altBilgi: altBilgi,
                yaziciBluetoothAd: yaziciBluetoothAd,
                yaziciBluetoothMac: yaziciBluetoothMac,
                varsayilanDonemId: varsayilanDonemId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> kullaniciAdi = const Value.absent(),
                Value<String?> sifre = const Value.absent(),
                Value<String?> kullaniciTel = const Value.absent(),
                Value<double> suM3Fiyat = const Value.absent(),
                Value<String?> antetBaslik = const Value.absent(),
                Value<String?> antetAdres = const Value.absent(),
                Value<String?> altBilgi = const Value.absent(),
                Value<String?> yaziciBluetoothAd = const Value.absent(),
                Value<String?> yaziciBluetoothMac = const Value.absent(),
                Value<int?> varsayilanDonemId = const Value.absent(),
              }) => AyarlarCompanion.insert(
                id: id,
                kullaniciAdi: kullaniciAdi,
                sifre: sifre,
                kullaniciTel: kullaniciTel,
                suM3Fiyat: suM3Fiyat,
                antetBaslik: antetBaslik,
                antetAdres: antetAdres,
                altBilgi: altBilgi,
                yaziciBluetoothAd: yaziciBluetoothAd,
                yaziciBluetoothMac: yaziciBluetoothMac,
                varsayilanDonemId: varsayilanDonemId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AyarlarTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AyarlarTable,
      AyarlarData,
      $$AyarlarTableFilterComposer,
      $$AyarlarTableOrderingComposer,
      $$AyarlarTableAnnotationComposer,
      $$AyarlarTableCreateCompanionBuilder,
      $$AyarlarTableUpdateCompanionBuilder,
      (AyarlarData, BaseReferences<_$AppDatabase, $AyarlarTable, AyarlarData>),
      AyarlarData,
      PrefetchHooks Function()
    >;
typedef $$DonemlerTableCreateCompanionBuilder =
    DonemlerCompanion Function({
      Value<int> id,
      required String ad,
      required String baslangicTarihi,
      required String bitisTarihi,
      Value<String?> sonOdemeTarihi,
    });
typedef $$DonemlerTableUpdateCompanionBuilder =
    DonemlerCompanion Function({
      Value<int> id,
      Value<String> ad,
      Value<String> baslangicTarihi,
      Value<String> bitisTarihi,
      Value<String?> sonOdemeTarihi,
    });

final class $$DonemlerTableReferences
    extends BaseReferences<_$AppDatabase, $DonemlerTable, DonemlerData> {
  $$DonemlerTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TahakkuklarTable, List<TahakkuklarData>>
  _tahakkuklarRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tahakkuklar,
    aliasName: $_aliasNameGenerator(db.donemler.id, db.tahakkuklar.donemId),
  );

  $$TahakkuklarTableProcessedTableManager get tahakkuklarRefs {
    final manager = $$TahakkuklarTableTableManager(
      $_db,
      $_db.tahakkuklar,
    ).filter((f) => f.donemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tahakkuklarRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DonemlerTableFilterComposer
    extends Composer<_$AppDatabase, $DonemlerTable> {
  $$DonemlerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ad => $composableBuilder(
    column: $table.ad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baslangicTarihi => $composableBuilder(
    column: $table.baslangicTarihi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bitisTarihi => $composableBuilder(
    column: $table.bitisTarihi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sonOdemeTarihi => $composableBuilder(
    column: $table.sonOdemeTarihi,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tahakkuklarRefs(
    Expression<bool> Function($$TahakkuklarTableFilterComposer f) f,
  ) {
    final $$TahakkuklarTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tahakkuklar,
      getReferencedColumn: (t) => t.donemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TahakkuklarTableFilterComposer(
            $db: $db,
            $table: $db.tahakkuklar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DonemlerTableOrderingComposer
    extends Composer<_$AppDatabase, $DonemlerTable> {
  $$DonemlerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ad => $composableBuilder(
    column: $table.ad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baslangicTarihi => $composableBuilder(
    column: $table.baslangicTarihi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bitisTarihi => $composableBuilder(
    column: $table.bitisTarihi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sonOdemeTarihi => $composableBuilder(
    column: $table.sonOdemeTarihi,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DonemlerTableAnnotationComposer
    extends Composer<_$AppDatabase, $DonemlerTable> {
  $$DonemlerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ad =>
      $composableBuilder(column: $table.ad, builder: (column) => column);

  GeneratedColumn<String> get baslangicTarihi => $composableBuilder(
    column: $table.baslangicTarihi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bitisTarihi => $composableBuilder(
    column: $table.bitisTarihi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sonOdemeTarihi => $composableBuilder(
    column: $table.sonOdemeTarihi,
    builder: (column) => column,
  );

  Expression<T> tahakkuklarRefs<T extends Object>(
    Expression<T> Function($$TahakkuklarTableAnnotationComposer a) f,
  ) {
    final $$TahakkuklarTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tahakkuklar,
      getReferencedColumn: (t) => t.donemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TahakkuklarTableAnnotationComposer(
            $db: $db,
            $table: $db.tahakkuklar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DonemlerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DonemlerTable,
          DonemlerData,
          $$DonemlerTableFilterComposer,
          $$DonemlerTableOrderingComposer,
          $$DonemlerTableAnnotationComposer,
          $$DonemlerTableCreateCompanionBuilder,
          $$DonemlerTableUpdateCompanionBuilder,
          (DonemlerData, $$DonemlerTableReferences),
          DonemlerData,
          PrefetchHooks Function({bool tahakkuklarRefs})
        > {
  $$DonemlerTableTableManager(_$AppDatabase db, $DonemlerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DonemlerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DonemlerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DonemlerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> ad = const Value.absent(),
                Value<String> baslangicTarihi = const Value.absent(),
                Value<String> bitisTarihi = const Value.absent(),
                Value<String?> sonOdemeTarihi = const Value.absent(),
              }) => DonemlerCompanion(
                id: id,
                ad: ad,
                baslangicTarihi: baslangicTarihi,
                bitisTarihi: bitisTarihi,
                sonOdemeTarihi: sonOdemeTarihi,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String ad,
                required String baslangicTarihi,
                required String bitisTarihi,
                Value<String?> sonOdemeTarihi = const Value.absent(),
              }) => DonemlerCompanion.insert(
                id: id,
                ad: ad,
                baslangicTarihi: baslangicTarihi,
                bitisTarihi: bitisTarihi,
                sonOdemeTarihi: sonOdemeTarihi,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DonemlerTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tahakkuklarRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tahakkuklarRefs) db.tahakkuklar],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tahakkuklarRefs)
                    await $_getPrefetchedData<
                      DonemlerData,
                      $DonemlerTable,
                      TahakkuklarData
                    >(
                      currentTable: table,
                      referencedTable: $$DonemlerTableReferences
                          ._tahakkuklarRefsTable(db),
                      managerFromTypedResult: (p0) => $$DonemlerTableReferences(
                        db,
                        table,
                        p0,
                      ).tahakkuklarRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.donemId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DonemlerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DonemlerTable,
      DonemlerData,
      $$DonemlerTableFilterComposer,
      $$DonemlerTableOrderingComposer,
      $$DonemlerTableAnnotationComposer,
      $$DonemlerTableCreateCompanionBuilder,
      $$DonemlerTableUpdateCompanionBuilder,
      (DonemlerData, $$DonemlerTableReferences),
      DonemlerData,
      PrefetchHooks Function({bool tahakkuklarRefs})
    >;
typedef $$AbonelerTableCreateCompanionBuilder =
    AbonelerCompanion Function({
      Value<int> id,
      required String ad,
      Value<String?> soyad,
      Value<String?> tel,
      required String aboneNo,
      Value<String?> saatNo,
      Value<String?> saatDurumu,
      Value<String?> adres,
      Value<String?> aciklama,
      Value<int> aktif,
    });
typedef $$AbonelerTableUpdateCompanionBuilder =
    AbonelerCompanion Function({
      Value<int> id,
      Value<String> ad,
      Value<String?> soyad,
      Value<String?> tel,
      Value<String> aboneNo,
      Value<String?> saatNo,
      Value<String?> saatDurumu,
      Value<String?> adres,
      Value<String?> aciklama,
      Value<int> aktif,
    });

final class $$AbonelerTableReferences
    extends BaseReferences<_$AppDatabase, $AbonelerTable, AbonelerData> {
  $$AbonelerTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EndekslerTable, List<EndekslerData>>
  _endekslerRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.endeksler,
    aliasName: $_aliasNameGenerator(db.aboneler.id, db.endeksler.aboneId),
  );

  $$EndekslerTableProcessedTableManager get endekslerRefs {
    final manager = $$EndekslerTableTableManager(
      $_db,
      $_db.endeksler,
    ).filter((f) => f.aboneId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_endekslerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TahakkuklarTable, List<TahakkuklarData>>
  _tahakkuklarRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tahakkuklar,
    aliasName: $_aliasNameGenerator(db.aboneler.id, db.tahakkuklar.aboneId),
  );

  $$TahakkuklarTableProcessedTableManager get tahakkuklarRefs {
    final manager = $$TahakkuklarTableTableManager(
      $_db,
      $_db.tahakkuklar,
    ).filter((f) => f.aboneId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tahakkuklarRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SayaclarTable, List<SayaclarData>>
  _sayaclarRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sayaclar,
    aliasName: $_aliasNameGenerator(db.aboneler.id, db.sayaclar.aboneId),
  );

  $$SayaclarTableProcessedTableManager get sayaclarRefs {
    final manager = $$SayaclarTableTableManager(
      $_db,
      $_db.sayaclar,
    ).filter((f) => f.aboneId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sayaclarRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AbonelerTableFilterComposer
    extends Composer<_$AppDatabase, $AbonelerTable> {
  $$AbonelerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ad => $composableBuilder(
    column: $table.ad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get soyad => $composableBuilder(
    column: $table.soyad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tel => $composableBuilder(
    column: $table.tel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aboneNo => $composableBuilder(
    column: $table.aboneNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get saatNo => $composableBuilder(
    column: $table.saatNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get saatDurumu => $composableBuilder(
    column: $table.saatDurumu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adres => $composableBuilder(
    column: $table.adres,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aciklama => $composableBuilder(
    column: $table.aciklama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get aktif => $composableBuilder(
    column: $table.aktif,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> endekslerRefs(
    Expression<bool> Function($$EndekslerTableFilterComposer f) f,
  ) {
    final $$EndekslerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.endeksler,
      getReferencedColumn: (t) => t.aboneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndekslerTableFilterComposer(
            $db: $db,
            $table: $db.endeksler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tahakkuklarRefs(
    Expression<bool> Function($$TahakkuklarTableFilterComposer f) f,
  ) {
    final $$TahakkuklarTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tahakkuklar,
      getReferencedColumn: (t) => t.aboneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TahakkuklarTableFilterComposer(
            $db: $db,
            $table: $db.tahakkuklar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sayaclarRefs(
    Expression<bool> Function($$SayaclarTableFilterComposer f) f,
  ) {
    final $$SayaclarTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sayaclar,
      getReferencedColumn: (t) => t.aboneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SayaclarTableFilterComposer(
            $db: $db,
            $table: $db.sayaclar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AbonelerTableOrderingComposer
    extends Composer<_$AppDatabase, $AbonelerTable> {
  $$AbonelerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ad => $composableBuilder(
    column: $table.ad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get soyad => $composableBuilder(
    column: $table.soyad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tel => $composableBuilder(
    column: $table.tel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aboneNo => $composableBuilder(
    column: $table.aboneNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get saatNo => $composableBuilder(
    column: $table.saatNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get saatDurumu => $composableBuilder(
    column: $table.saatDurumu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adres => $composableBuilder(
    column: $table.adres,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aciklama => $composableBuilder(
    column: $table.aciklama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get aktif => $composableBuilder(
    column: $table.aktif,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AbonelerTableAnnotationComposer
    extends Composer<_$AppDatabase, $AbonelerTable> {
  $$AbonelerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ad =>
      $composableBuilder(column: $table.ad, builder: (column) => column);

  GeneratedColumn<String> get soyad =>
      $composableBuilder(column: $table.soyad, builder: (column) => column);

  GeneratedColumn<String> get tel =>
      $composableBuilder(column: $table.tel, builder: (column) => column);

  GeneratedColumn<String> get aboneNo =>
      $composableBuilder(column: $table.aboneNo, builder: (column) => column);

  GeneratedColumn<String> get saatNo =>
      $composableBuilder(column: $table.saatNo, builder: (column) => column);

  GeneratedColumn<String> get saatDurumu => $composableBuilder(
    column: $table.saatDurumu,
    builder: (column) => column,
  );

  GeneratedColumn<String> get adres =>
      $composableBuilder(column: $table.adres, builder: (column) => column);

  GeneratedColumn<String> get aciklama =>
      $composableBuilder(column: $table.aciklama, builder: (column) => column);

  GeneratedColumn<int> get aktif =>
      $composableBuilder(column: $table.aktif, builder: (column) => column);

  Expression<T> endekslerRefs<T extends Object>(
    Expression<T> Function($$EndekslerTableAnnotationComposer a) f,
  ) {
    final $$EndekslerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.endeksler,
      getReferencedColumn: (t) => t.aboneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndekslerTableAnnotationComposer(
            $db: $db,
            $table: $db.endeksler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tahakkuklarRefs<T extends Object>(
    Expression<T> Function($$TahakkuklarTableAnnotationComposer a) f,
  ) {
    final $$TahakkuklarTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tahakkuklar,
      getReferencedColumn: (t) => t.aboneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TahakkuklarTableAnnotationComposer(
            $db: $db,
            $table: $db.tahakkuklar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sayaclarRefs<T extends Object>(
    Expression<T> Function($$SayaclarTableAnnotationComposer a) f,
  ) {
    final $$SayaclarTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sayaclar,
      getReferencedColumn: (t) => t.aboneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SayaclarTableAnnotationComposer(
            $db: $db,
            $table: $db.sayaclar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AbonelerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AbonelerTable,
          AbonelerData,
          $$AbonelerTableFilterComposer,
          $$AbonelerTableOrderingComposer,
          $$AbonelerTableAnnotationComposer,
          $$AbonelerTableCreateCompanionBuilder,
          $$AbonelerTableUpdateCompanionBuilder,
          (AbonelerData, $$AbonelerTableReferences),
          AbonelerData,
          PrefetchHooks Function({
            bool endekslerRefs,
            bool tahakkuklarRefs,
            bool sayaclarRefs,
          })
        > {
  $$AbonelerTableTableManager(_$AppDatabase db, $AbonelerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AbonelerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AbonelerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AbonelerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> ad = const Value.absent(),
                Value<String?> soyad = const Value.absent(),
                Value<String?> tel = const Value.absent(),
                Value<String> aboneNo = const Value.absent(),
                Value<String?> saatNo = const Value.absent(),
                Value<String?> saatDurumu = const Value.absent(),
                Value<String?> adres = const Value.absent(),
                Value<String?> aciklama = const Value.absent(),
                Value<int> aktif = const Value.absent(),
              }) => AbonelerCompanion(
                id: id,
                ad: ad,
                soyad: soyad,
                tel: tel,
                aboneNo: aboneNo,
                saatNo: saatNo,
                saatDurumu: saatDurumu,
                adres: adres,
                aciklama: aciklama,
                aktif: aktif,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String ad,
                Value<String?> soyad = const Value.absent(),
                Value<String?> tel = const Value.absent(),
                required String aboneNo,
                Value<String?> saatNo = const Value.absent(),
                Value<String?> saatDurumu = const Value.absent(),
                Value<String?> adres = const Value.absent(),
                Value<String?> aciklama = const Value.absent(),
                Value<int> aktif = const Value.absent(),
              }) => AbonelerCompanion.insert(
                id: id,
                ad: ad,
                soyad: soyad,
                tel: tel,
                aboneNo: aboneNo,
                saatNo: saatNo,
                saatDurumu: saatDurumu,
                adres: adres,
                aciklama: aciklama,
                aktif: aktif,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AbonelerTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                endekslerRefs = false,
                tahakkuklarRefs = false,
                sayaclarRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (endekslerRefs) db.endeksler,
                    if (tahakkuklarRefs) db.tahakkuklar,
                    if (sayaclarRefs) db.sayaclar,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (endekslerRefs)
                        await $_getPrefetchedData<
                          AbonelerData,
                          $AbonelerTable,
                          EndekslerData
                        >(
                          currentTable: table,
                          referencedTable: $$AbonelerTableReferences
                              ._endekslerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AbonelerTableReferences(
                                db,
                                table,
                                p0,
                              ).endekslerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.aboneId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (tahakkuklarRefs)
                        await $_getPrefetchedData<
                          AbonelerData,
                          $AbonelerTable,
                          TahakkuklarData
                        >(
                          currentTable: table,
                          referencedTable: $$AbonelerTableReferences
                              ._tahakkuklarRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AbonelerTableReferences(
                                db,
                                table,
                                p0,
                              ).tahakkuklarRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.aboneId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sayaclarRefs)
                        await $_getPrefetchedData<
                          AbonelerData,
                          $AbonelerTable,
                          SayaclarData
                        >(
                          currentTable: table,
                          referencedTable: $$AbonelerTableReferences
                              ._sayaclarRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AbonelerTableReferences(
                                db,
                                table,
                                p0,
                              ).sayaclarRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.aboneId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AbonelerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AbonelerTable,
      AbonelerData,
      $$AbonelerTableFilterComposer,
      $$AbonelerTableOrderingComposer,
      $$AbonelerTableAnnotationComposer,
      $$AbonelerTableCreateCompanionBuilder,
      $$AbonelerTableUpdateCompanionBuilder,
      (AbonelerData, $$AbonelerTableReferences),
      AbonelerData,
      PrefetchHooks Function({
        bool endekslerRefs,
        bool tahakkuklarRefs,
        bool sayaclarRefs,
      })
    >;
typedef $$EndekslerTableCreateCompanionBuilder =
    EndekslerCompanion Function({
      Value<int> id,
      required int aboneId,
      required String tarih,
      required double endeks,
      Value<String?> okuyanKisi,
      Value<String?> fotoPath,
      Value<String?> aciklama,
    });
typedef $$EndekslerTableUpdateCompanionBuilder =
    EndekslerCompanion Function({
      Value<int> id,
      Value<int> aboneId,
      Value<String> tarih,
      Value<double> endeks,
      Value<String?> okuyanKisi,
      Value<String?> fotoPath,
      Value<String?> aciklama,
    });

final class $$EndekslerTableReferences
    extends BaseReferences<_$AppDatabase, $EndekslerTable, EndekslerData> {
  $$EndekslerTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AbonelerTable _aboneIdTable(_$AppDatabase db) => db.aboneler
      .createAlias($_aliasNameGenerator(db.endeksler.aboneId, db.aboneler.id));

  $$AbonelerTableProcessedTableManager get aboneId {
    final $_column = $_itemColumn<int>('abone_id')!;

    final manager = $$AbonelerTableTableManager(
      $_db,
      $_db.aboneler,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aboneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EndekslerTableFilterComposer
    extends Composer<_$AppDatabase, $EndekslerTable> {
  $$EndekslerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tarih => $composableBuilder(
    column: $table.tarih,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get endeks => $composableBuilder(
    column: $table.endeks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get okuyanKisi => $composableBuilder(
    column: $table.okuyanKisi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fotoPath => $composableBuilder(
    column: $table.fotoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aciklama => $composableBuilder(
    column: $table.aciklama,
    builder: (column) => ColumnFilters(column),
  );

  $$AbonelerTableFilterComposer get aboneId {
    final $$AbonelerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aboneId,
      referencedTable: $db.aboneler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbonelerTableFilterComposer(
            $db: $db,
            $table: $db.aboneler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EndekslerTableOrderingComposer
    extends Composer<_$AppDatabase, $EndekslerTable> {
  $$EndekslerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tarih => $composableBuilder(
    column: $table.tarih,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get endeks => $composableBuilder(
    column: $table.endeks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get okuyanKisi => $composableBuilder(
    column: $table.okuyanKisi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fotoPath => $composableBuilder(
    column: $table.fotoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aciklama => $composableBuilder(
    column: $table.aciklama,
    builder: (column) => ColumnOrderings(column),
  );

  $$AbonelerTableOrderingComposer get aboneId {
    final $$AbonelerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aboneId,
      referencedTable: $db.aboneler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbonelerTableOrderingComposer(
            $db: $db,
            $table: $db.aboneler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EndekslerTableAnnotationComposer
    extends Composer<_$AppDatabase, $EndekslerTable> {
  $$EndekslerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tarih =>
      $composableBuilder(column: $table.tarih, builder: (column) => column);

  GeneratedColumn<double> get endeks =>
      $composableBuilder(column: $table.endeks, builder: (column) => column);

  GeneratedColumn<String> get okuyanKisi => $composableBuilder(
    column: $table.okuyanKisi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fotoPath =>
      $composableBuilder(column: $table.fotoPath, builder: (column) => column);

  GeneratedColumn<String> get aciklama =>
      $composableBuilder(column: $table.aciklama, builder: (column) => column);

  $$AbonelerTableAnnotationComposer get aboneId {
    final $$AbonelerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aboneId,
      referencedTable: $db.aboneler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbonelerTableAnnotationComposer(
            $db: $db,
            $table: $db.aboneler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EndekslerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EndekslerTable,
          EndekslerData,
          $$EndekslerTableFilterComposer,
          $$EndekslerTableOrderingComposer,
          $$EndekslerTableAnnotationComposer,
          $$EndekslerTableCreateCompanionBuilder,
          $$EndekslerTableUpdateCompanionBuilder,
          (EndekslerData, $$EndekslerTableReferences),
          EndekslerData,
          PrefetchHooks Function({bool aboneId})
        > {
  $$EndekslerTableTableManager(_$AppDatabase db, $EndekslerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EndekslerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EndekslerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EndekslerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> aboneId = const Value.absent(),
                Value<String> tarih = const Value.absent(),
                Value<double> endeks = const Value.absent(),
                Value<String?> okuyanKisi = const Value.absent(),
                Value<String?> fotoPath = const Value.absent(),
                Value<String?> aciklama = const Value.absent(),
              }) => EndekslerCompanion(
                id: id,
                aboneId: aboneId,
                tarih: tarih,
                endeks: endeks,
                okuyanKisi: okuyanKisi,
                fotoPath: fotoPath,
                aciklama: aciklama,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int aboneId,
                required String tarih,
                required double endeks,
                Value<String?> okuyanKisi = const Value.absent(),
                Value<String?> fotoPath = const Value.absent(),
                Value<String?> aciklama = const Value.absent(),
              }) => EndekslerCompanion.insert(
                id: id,
                aboneId: aboneId,
                tarih: tarih,
                endeks: endeks,
                okuyanKisi: okuyanKisi,
                fotoPath: fotoPath,
                aciklama: aciklama,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EndekslerTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({aboneId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (aboneId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.aboneId,
                                referencedTable: $$EndekslerTableReferences
                                    ._aboneIdTable(db),
                                referencedColumn: $$EndekslerTableReferences
                                    ._aboneIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EndekslerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EndekslerTable,
      EndekslerData,
      $$EndekslerTableFilterComposer,
      $$EndekslerTableOrderingComposer,
      $$EndekslerTableAnnotationComposer,
      $$EndekslerTableCreateCompanionBuilder,
      $$EndekslerTableUpdateCompanionBuilder,
      (EndekslerData, $$EndekslerTableReferences),
      EndekslerData,
      PrefetchHooks Function({bool aboneId})
    >;
typedef $$TahakkuklarTableCreateCompanionBuilder =
    TahakkuklarCompanion Function({
      Value<int> id,
      Value<String> uuid,
      required int aboneId,
      required int donemId,
      Value<int?> ilkEndeksId,
      Value<int?> sonEndeksId,
      Value<double?> ilkEndeks,
      Value<double?> sonEndeks,
      Value<double?> tuketimM3,
      required double birimFiyat,
      required double tutar,
      required String olusturmaTarihi,
      Value<String> durum,
    });
typedef $$TahakkuklarTableUpdateCompanionBuilder =
    TahakkuklarCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<int> aboneId,
      Value<int> donemId,
      Value<int?> ilkEndeksId,
      Value<int?> sonEndeksId,
      Value<double?> ilkEndeks,
      Value<double?> sonEndeks,
      Value<double?> tuketimM3,
      Value<double> birimFiyat,
      Value<double> tutar,
      Value<String> olusturmaTarihi,
      Value<String> durum,
    });

final class $$TahakkuklarTableReferences
    extends BaseReferences<_$AppDatabase, $TahakkuklarTable, TahakkuklarData> {
  $$TahakkuklarTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AbonelerTable _aboneIdTable(_$AppDatabase db) =>
      db.aboneler.createAlias(
        $_aliasNameGenerator(db.tahakkuklar.aboneId, db.aboneler.id),
      );

  $$AbonelerTableProcessedTableManager get aboneId {
    final $_column = $_itemColumn<int>('abone_id')!;

    final manager = $$AbonelerTableTableManager(
      $_db,
      $_db.aboneler,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aboneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DonemlerTable _donemIdTable(_$AppDatabase db) =>
      db.donemler.createAlias(
        $_aliasNameGenerator(db.tahakkuklar.donemId, db.donemler.id),
      );

  $$DonemlerTableProcessedTableManager get donemId {
    final $_column = $_itemColumn<int>('donem_id')!;

    final manager = $$DonemlerTableTableManager(
      $_db,
      $_db.donemler,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_donemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EndekslerTable _ilkEndeksIdTable(_$AppDatabase db) =>
      db.endeksler.createAlias(
        $_aliasNameGenerator(db.tahakkuklar.ilkEndeksId, db.endeksler.id),
      );

  $$EndekslerTableProcessedTableManager? get ilkEndeksId {
    final $_column = $_itemColumn<int>('ilk_endeks_id');
    if ($_column == null) return null;
    final manager = $$EndekslerTableTableManager(
      $_db,
      $_db.endeksler,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ilkEndeksIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EndekslerTable _sonEndeksIdTable(_$AppDatabase db) =>
      db.endeksler.createAlias(
        $_aliasNameGenerator(db.tahakkuklar.sonEndeksId, db.endeksler.id),
      );

  $$EndekslerTableProcessedTableManager? get sonEndeksId {
    final $_column = $_itemColumn<int>('son_endeks_id');
    if ($_column == null) return null;
    final manager = $$EndekslerTableTableManager(
      $_db,
      $_db.endeksler,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sonEndeksIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TahsilatlarTable, List<TahsilatlarData>>
  _tahsilatlarRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tahsilatlar,
    aliasName: $_aliasNameGenerator(
      db.tahakkuklar.id,
      db.tahsilatlar.tahakkukId,
    ),
  );

  $$TahsilatlarTableProcessedTableManager get tahsilatlarRefs {
    final manager = $$TahsilatlarTableTableManager(
      $_db,
      $_db.tahsilatlar,
    ).filter((f) => f.tahakkukId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tahsilatlarRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TahakkuklarTableFilterComposer
    extends Composer<_$AppDatabase, $TahakkuklarTable> {
  $$TahakkuklarTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ilkEndeks => $composableBuilder(
    column: $table.ilkEndeks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sonEndeks => $composableBuilder(
    column: $table.sonEndeks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tuketimM3 => $composableBuilder(
    column: $table.tuketimM3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get birimFiyat => $composableBuilder(
    column: $table.birimFiyat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tutar => $composableBuilder(
    column: $table.tutar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get olusturmaTarihi => $composableBuilder(
    column: $table.olusturmaTarihi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get durum => $composableBuilder(
    column: $table.durum,
    builder: (column) => ColumnFilters(column),
  );

  $$AbonelerTableFilterComposer get aboneId {
    final $$AbonelerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aboneId,
      referencedTable: $db.aboneler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbonelerTableFilterComposer(
            $db: $db,
            $table: $db.aboneler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DonemlerTableFilterComposer get donemId {
    final $$DonemlerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.donemId,
      referencedTable: $db.donemler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DonemlerTableFilterComposer(
            $db: $db,
            $table: $db.donemler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EndekslerTableFilterComposer get ilkEndeksId {
    final $$EndekslerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ilkEndeksId,
      referencedTable: $db.endeksler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndekslerTableFilterComposer(
            $db: $db,
            $table: $db.endeksler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EndekslerTableFilterComposer get sonEndeksId {
    final $$EndekslerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sonEndeksId,
      referencedTable: $db.endeksler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndekslerTableFilterComposer(
            $db: $db,
            $table: $db.endeksler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> tahsilatlarRefs(
    Expression<bool> Function($$TahsilatlarTableFilterComposer f) f,
  ) {
    final $$TahsilatlarTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tahsilatlar,
      getReferencedColumn: (t) => t.tahakkukId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TahsilatlarTableFilterComposer(
            $db: $db,
            $table: $db.tahsilatlar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TahakkuklarTableOrderingComposer
    extends Composer<_$AppDatabase, $TahakkuklarTable> {
  $$TahakkuklarTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ilkEndeks => $composableBuilder(
    column: $table.ilkEndeks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sonEndeks => $composableBuilder(
    column: $table.sonEndeks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tuketimM3 => $composableBuilder(
    column: $table.tuketimM3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get birimFiyat => $composableBuilder(
    column: $table.birimFiyat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tutar => $composableBuilder(
    column: $table.tutar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get olusturmaTarihi => $composableBuilder(
    column: $table.olusturmaTarihi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get durum => $composableBuilder(
    column: $table.durum,
    builder: (column) => ColumnOrderings(column),
  );

  $$AbonelerTableOrderingComposer get aboneId {
    final $$AbonelerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aboneId,
      referencedTable: $db.aboneler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbonelerTableOrderingComposer(
            $db: $db,
            $table: $db.aboneler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DonemlerTableOrderingComposer get donemId {
    final $$DonemlerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.donemId,
      referencedTable: $db.donemler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DonemlerTableOrderingComposer(
            $db: $db,
            $table: $db.donemler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EndekslerTableOrderingComposer get ilkEndeksId {
    final $$EndekslerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ilkEndeksId,
      referencedTable: $db.endeksler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndekslerTableOrderingComposer(
            $db: $db,
            $table: $db.endeksler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EndekslerTableOrderingComposer get sonEndeksId {
    final $$EndekslerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sonEndeksId,
      referencedTable: $db.endeksler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndekslerTableOrderingComposer(
            $db: $db,
            $table: $db.endeksler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TahakkuklarTableAnnotationComposer
    extends Composer<_$AppDatabase, $TahakkuklarTable> {
  $$TahakkuklarTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<double> get ilkEndeks =>
      $composableBuilder(column: $table.ilkEndeks, builder: (column) => column);

  GeneratedColumn<double> get sonEndeks =>
      $composableBuilder(column: $table.sonEndeks, builder: (column) => column);

  GeneratedColumn<double> get tuketimM3 =>
      $composableBuilder(column: $table.tuketimM3, builder: (column) => column);

  GeneratedColumn<double> get birimFiyat => $composableBuilder(
    column: $table.birimFiyat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get tutar =>
      $composableBuilder(column: $table.tutar, builder: (column) => column);

  GeneratedColumn<String> get olusturmaTarihi => $composableBuilder(
    column: $table.olusturmaTarihi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get durum =>
      $composableBuilder(column: $table.durum, builder: (column) => column);

  $$AbonelerTableAnnotationComposer get aboneId {
    final $$AbonelerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aboneId,
      referencedTable: $db.aboneler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbonelerTableAnnotationComposer(
            $db: $db,
            $table: $db.aboneler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DonemlerTableAnnotationComposer get donemId {
    final $$DonemlerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.donemId,
      referencedTable: $db.donemler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DonemlerTableAnnotationComposer(
            $db: $db,
            $table: $db.donemler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EndekslerTableAnnotationComposer get ilkEndeksId {
    final $$EndekslerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ilkEndeksId,
      referencedTable: $db.endeksler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndekslerTableAnnotationComposer(
            $db: $db,
            $table: $db.endeksler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EndekslerTableAnnotationComposer get sonEndeksId {
    final $$EndekslerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sonEndeksId,
      referencedTable: $db.endeksler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EndekslerTableAnnotationComposer(
            $db: $db,
            $table: $db.endeksler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> tahsilatlarRefs<T extends Object>(
    Expression<T> Function($$TahsilatlarTableAnnotationComposer a) f,
  ) {
    final $$TahsilatlarTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tahsilatlar,
      getReferencedColumn: (t) => t.tahakkukId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TahsilatlarTableAnnotationComposer(
            $db: $db,
            $table: $db.tahsilatlar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TahakkuklarTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TahakkuklarTable,
          TahakkuklarData,
          $$TahakkuklarTableFilterComposer,
          $$TahakkuklarTableOrderingComposer,
          $$TahakkuklarTableAnnotationComposer,
          $$TahakkuklarTableCreateCompanionBuilder,
          $$TahakkuklarTableUpdateCompanionBuilder,
          (TahakkuklarData, $$TahakkuklarTableReferences),
          TahakkuklarData,
          PrefetchHooks Function({
            bool aboneId,
            bool donemId,
            bool ilkEndeksId,
            bool sonEndeksId,
            bool tahsilatlarRefs,
          })
        > {
  $$TahakkuklarTableTableManager(_$AppDatabase db, $TahakkuklarTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TahakkuklarTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TahakkuklarTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TahakkuklarTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<int> aboneId = const Value.absent(),
                Value<int> donemId = const Value.absent(),
                Value<int?> ilkEndeksId = const Value.absent(),
                Value<int?> sonEndeksId = const Value.absent(),
                Value<double?> ilkEndeks = const Value.absent(),
                Value<double?> sonEndeks = const Value.absent(),
                Value<double?> tuketimM3 = const Value.absent(),
                Value<double> birimFiyat = const Value.absent(),
                Value<double> tutar = const Value.absent(),
                Value<String> olusturmaTarihi = const Value.absent(),
                Value<String> durum = const Value.absent(),
              }) => TahakkuklarCompanion(
                id: id,
                uuid: uuid,
                aboneId: aboneId,
                donemId: donemId,
                ilkEndeksId: ilkEndeksId,
                sonEndeksId: sonEndeksId,
                ilkEndeks: ilkEndeks,
                sonEndeks: sonEndeks,
                tuketimM3: tuketimM3,
                birimFiyat: birimFiyat,
                tutar: tutar,
                olusturmaTarihi: olusturmaTarihi,
                durum: durum,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                required int aboneId,
                required int donemId,
                Value<int?> ilkEndeksId = const Value.absent(),
                Value<int?> sonEndeksId = const Value.absent(),
                Value<double?> ilkEndeks = const Value.absent(),
                Value<double?> sonEndeks = const Value.absent(),
                Value<double?> tuketimM3 = const Value.absent(),
                required double birimFiyat,
                required double tutar,
                required String olusturmaTarihi,
                Value<String> durum = const Value.absent(),
              }) => TahakkuklarCompanion.insert(
                id: id,
                uuid: uuid,
                aboneId: aboneId,
                donemId: donemId,
                ilkEndeksId: ilkEndeksId,
                sonEndeksId: sonEndeksId,
                ilkEndeks: ilkEndeks,
                sonEndeks: sonEndeks,
                tuketimM3: tuketimM3,
                birimFiyat: birimFiyat,
                tutar: tutar,
                olusturmaTarihi: olusturmaTarihi,
                durum: durum,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TahakkuklarTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                aboneId = false,
                donemId = false,
                ilkEndeksId = false,
                sonEndeksId = false,
                tahsilatlarRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (tahsilatlarRefs) db.tahsilatlar,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (aboneId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.aboneId,
                                    referencedTable:
                                        $$TahakkuklarTableReferences
                                            ._aboneIdTable(db),
                                    referencedColumn:
                                        $$TahakkuklarTableReferences
                                            ._aboneIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (donemId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.donemId,
                                    referencedTable:
                                        $$TahakkuklarTableReferences
                                            ._donemIdTable(db),
                                    referencedColumn:
                                        $$TahakkuklarTableReferences
                                            ._donemIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (ilkEndeksId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ilkEndeksId,
                                    referencedTable:
                                        $$TahakkuklarTableReferences
                                            ._ilkEndeksIdTable(db),
                                    referencedColumn:
                                        $$TahakkuklarTableReferences
                                            ._ilkEndeksIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (sonEndeksId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sonEndeksId,
                                    referencedTable:
                                        $$TahakkuklarTableReferences
                                            ._sonEndeksIdTable(db),
                                    referencedColumn:
                                        $$TahakkuklarTableReferences
                                            ._sonEndeksIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (tahsilatlarRefs)
                        await $_getPrefetchedData<
                          TahakkuklarData,
                          $TahakkuklarTable,
                          TahsilatlarData
                        >(
                          currentTable: table,
                          referencedTable: $$TahakkuklarTableReferences
                              ._tahsilatlarRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TahakkuklarTableReferences(
                                db,
                                table,
                                p0,
                              ).tahsilatlarRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tahakkukId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TahakkuklarTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TahakkuklarTable,
      TahakkuklarData,
      $$TahakkuklarTableFilterComposer,
      $$TahakkuklarTableOrderingComposer,
      $$TahakkuklarTableAnnotationComposer,
      $$TahakkuklarTableCreateCompanionBuilder,
      $$TahakkuklarTableUpdateCompanionBuilder,
      (TahakkuklarData, $$TahakkuklarTableReferences),
      TahakkuklarData,
      PrefetchHooks Function({
        bool aboneId,
        bool donemId,
        bool ilkEndeksId,
        bool sonEndeksId,
        bool tahsilatlarRefs,
      })
    >;
typedef $$TahsilatlarTableCreateCompanionBuilder =
    TahsilatlarCompanion Function({
      Value<int> id,
      required int tahakkukId,
      required String tarih,
      required double tutar,
      Value<String?> odemeTipi,
      Value<String?> aciklama,
    });
typedef $$TahsilatlarTableUpdateCompanionBuilder =
    TahsilatlarCompanion Function({
      Value<int> id,
      Value<int> tahakkukId,
      Value<String> tarih,
      Value<double> tutar,
      Value<String?> odemeTipi,
      Value<String?> aciklama,
    });

final class $$TahsilatlarTableReferences
    extends BaseReferences<_$AppDatabase, $TahsilatlarTable, TahsilatlarData> {
  $$TahsilatlarTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TahakkuklarTable _tahakkukIdTable(_$AppDatabase db) =>
      db.tahakkuklar.createAlias(
        $_aliasNameGenerator(db.tahsilatlar.tahakkukId, db.tahakkuklar.id),
      );

  $$TahakkuklarTableProcessedTableManager get tahakkukId {
    final $_column = $_itemColumn<int>('tahakkuk_id')!;

    final manager = $$TahakkuklarTableTableManager(
      $_db,
      $_db.tahakkuklar,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tahakkukIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TahsilatlarTableFilterComposer
    extends Composer<_$AppDatabase, $TahsilatlarTable> {
  $$TahsilatlarTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tarih => $composableBuilder(
    column: $table.tarih,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tutar => $composableBuilder(
    column: $table.tutar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get odemeTipi => $composableBuilder(
    column: $table.odemeTipi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aciklama => $composableBuilder(
    column: $table.aciklama,
    builder: (column) => ColumnFilters(column),
  );

  $$TahakkuklarTableFilterComposer get tahakkukId {
    final $$TahakkuklarTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tahakkukId,
      referencedTable: $db.tahakkuklar,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TahakkuklarTableFilterComposer(
            $db: $db,
            $table: $db.tahakkuklar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TahsilatlarTableOrderingComposer
    extends Composer<_$AppDatabase, $TahsilatlarTable> {
  $$TahsilatlarTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tarih => $composableBuilder(
    column: $table.tarih,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tutar => $composableBuilder(
    column: $table.tutar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get odemeTipi => $composableBuilder(
    column: $table.odemeTipi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aciklama => $composableBuilder(
    column: $table.aciklama,
    builder: (column) => ColumnOrderings(column),
  );

  $$TahakkuklarTableOrderingComposer get tahakkukId {
    final $$TahakkuklarTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tahakkukId,
      referencedTable: $db.tahakkuklar,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TahakkuklarTableOrderingComposer(
            $db: $db,
            $table: $db.tahakkuklar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TahsilatlarTableAnnotationComposer
    extends Composer<_$AppDatabase, $TahsilatlarTable> {
  $$TahsilatlarTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tarih =>
      $composableBuilder(column: $table.tarih, builder: (column) => column);

  GeneratedColumn<double> get tutar =>
      $composableBuilder(column: $table.tutar, builder: (column) => column);

  GeneratedColumn<String> get odemeTipi =>
      $composableBuilder(column: $table.odemeTipi, builder: (column) => column);

  GeneratedColumn<String> get aciklama =>
      $composableBuilder(column: $table.aciklama, builder: (column) => column);

  $$TahakkuklarTableAnnotationComposer get tahakkukId {
    final $$TahakkuklarTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tahakkukId,
      referencedTable: $db.tahakkuklar,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TahakkuklarTableAnnotationComposer(
            $db: $db,
            $table: $db.tahakkuklar,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TahsilatlarTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TahsilatlarTable,
          TahsilatlarData,
          $$TahsilatlarTableFilterComposer,
          $$TahsilatlarTableOrderingComposer,
          $$TahsilatlarTableAnnotationComposer,
          $$TahsilatlarTableCreateCompanionBuilder,
          $$TahsilatlarTableUpdateCompanionBuilder,
          (TahsilatlarData, $$TahsilatlarTableReferences),
          TahsilatlarData,
          PrefetchHooks Function({bool tahakkukId})
        > {
  $$TahsilatlarTableTableManager(_$AppDatabase db, $TahsilatlarTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TahsilatlarTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TahsilatlarTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TahsilatlarTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tahakkukId = const Value.absent(),
                Value<String> tarih = const Value.absent(),
                Value<double> tutar = const Value.absent(),
                Value<String?> odemeTipi = const Value.absent(),
                Value<String?> aciklama = const Value.absent(),
              }) => TahsilatlarCompanion(
                id: id,
                tahakkukId: tahakkukId,
                tarih: tarih,
                tutar: tutar,
                odemeTipi: odemeTipi,
                aciklama: aciklama,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tahakkukId,
                required String tarih,
                required double tutar,
                Value<String?> odemeTipi = const Value.absent(),
                Value<String?> aciklama = const Value.absent(),
              }) => TahsilatlarCompanion.insert(
                id: id,
                tahakkukId: tahakkukId,
                tarih: tarih,
                tutar: tutar,
                odemeTipi: odemeTipi,
                aciklama: aciklama,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TahsilatlarTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tahakkukId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (tahakkukId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tahakkukId,
                                referencedTable: $$TahsilatlarTableReferences
                                    ._tahakkukIdTable(db),
                                referencedColumn: $$TahsilatlarTableReferences
                                    ._tahakkukIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TahsilatlarTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TahsilatlarTable,
      TahsilatlarData,
      $$TahsilatlarTableFilterComposer,
      $$TahsilatlarTableOrderingComposer,
      $$TahsilatlarTableAnnotationComposer,
      $$TahsilatlarTableCreateCompanionBuilder,
      $$TahsilatlarTableUpdateCompanionBuilder,
      (TahsilatlarData, $$TahsilatlarTableReferences),
      TahsilatlarData,
      PrefetchHooks Function({bool tahakkukId})
    >;
typedef $$SayaclarTableCreateCompanionBuilder =
    SayaclarCompanion Function({
      Value<int> id,
      required int aboneId,
      required String saatNo,
      required double baslangicEndeks,
      required String baslangicTarihi,
      Value<double?> bitisEndeks,
      Value<String?> bitisTarihi,
      Value<int> aktif,
      Value<String?> aciklama,
    });
typedef $$SayaclarTableUpdateCompanionBuilder =
    SayaclarCompanion Function({
      Value<int> id,
      Value<int> aboneId,
      Value<String> saatNo,
      Value<double> baslangicEndeks,
      Value<String> baslangicTarihi,
      Value<double?> bitisEndeks,
      Value<String?> bitisTarihi,
      Value<int> aktif,
      Value<String?> aciklama,
    });

final class $$SayaclarTableReferences
    extends BaseReferences<_$AppDatabase, $SayaclarTable, SayaclarData> {
  $$SayaclarTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AbonelerTable _aboneIdTable(_$AppDatabase db) => db.aboneler
      .createAlias($_aliasNameGenerator(db.sayaclar.aboneId, db.aboneler.id));

  $$AbonelerTableProcessedTableManager get aboneId {
    final $_column = $_itemColumn<int>('abone_id')!;

    final manager = $$AbonelerTableTableManager(
      $_db,
      $_db.aboneler,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aboneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SayaclarTableFilterComposer
    extends Composer<_$AppDatabase, $SayaclarTable> {
  $$SayaclarTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get saatNo => $composableBuilder(
    column: $table.saatNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get baslangicEndeks => $composableBuilder(
    column: $table.baslangicEndeks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baslangicTarihi => $composableBuilder(
    column: $table.baslangicTarihi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bitisEndeks => $composableBuilder(
    column: $table.bitisEndeks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bitisTarihi => $composableBuilder(
    column: $table.bitisTarihi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get aktif => $composableBuilder(
    column: $table.aktif,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aciklama => $composableBuilder(
    column: $table.aciklama,
    builder: (column) => ColumnFilters(column),
  );

  $$AbonelerTableFilterComposer get aboneId {
    final $$AbonelerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aboneId,
      referencedTable: $db.aboneler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbonelerTableFilterComposer(
            $db: $db,
            $table: $db.aboneler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SayaclarTableOrderingComposer
    extends Composer<_$AppDatabase, $SayaclarTable> {
  $$SayaclarTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get saatNo => $composableBuilder(
    column: $table.saatNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get baslangicEndeks => $composableBuilder(
    column: $table.baslangicEndeks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baslangicTarihi => $composableBuilder(
    column: $table.baslangicTarihi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bitisEndeks => $composableBuilder(
    column: $table.bitisEndeks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bitisTarihi => $composableBuilder(
    column: $table.bitisTarihi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get aktif => $composableBuilder(
    column: $table.aktif,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aciklama => $composableBuilder(
    column: $table.aciklama,
    builder: (column) => ColumnOrderings(column),
  );

  $$AbonelerTableOrderingComposer get aboneId {
    final $$AbonelerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aboneId,
      referencedTable: $db.aboneler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbonelerTableOrderingComposer(
            $db: $db,
            $table: $db.aboneler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SayaclarTableAnnotationComposer
    extends Composer<_$AppDatabase, $SayaclarTable> {
  $$SayaclarTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get saatNo =>
      $composableBuilder(column: $table.saatNo, builder: (column) => column);

  GeneratedColumn<double> get baslangicEndeks => $composableBuilder(
    column: $table.baslangicEndeks,
    builder: (column) => column,
  );

  GeneratedColumn<String> get baslangicTarihi => $composableBuilder(
    column: $table.baslangicTarihi,
    builder: (column) => column,
  );

  GeneratedColumn<double> get bitisEndeks => $composableBuilder(
    column: $table.bitisEndeks,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bitisTarihi => $composableBuilder(
    column: $table.bitisTarihi,
    builder: (column) => column,
  );

  GeneratedColumn<int> get aktif =>
      $composableBuilder(column: $table.aktif, builder: (column) => column);

  GeneratedColumn<String> get aciklama =>
      $composableBuilder(column: $table.aciklama, builder: (column) => column);

  $$AbonelerTableAnnotationComposer get aboneId {
    final $$AbonelerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.aboneId,
      referencedTable: $db.aboneler,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbonelerTableAnnotationComposer(
            $db: $db,
            $table: $db.aboneler,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SayaclarTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SayaclarTable,
          SayaclarData,
          $$SayaclarTableFilterComposer,
          $$SayaclarTableOrderingComposer,
          $$SayaclarTableAnnotationComposer,
          $$SayaclarTableCreateCompanionBuilder,
          $$SayaclarTableUpdateCompanionBuilder,
          (SayaclarData, $$SayaclarTableReferences),
          SayaclarData,
          PrefetchHooks Function({bool aboneId})
        > {
  $$SayaclarTableTableManager(_$AppDatabase db, $SayaclarTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SayaclarTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SayaclarTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SayaclarTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> aboneId = const Value.absent(),
                Value<String> saatNo = const Value.absent(),
                Value<double> baslangicEndeks = const Value.absent(),
                Value<String> baslangicTarihi = const Value.absent(),
                Value<double?> bitisEndeks = const Value.absent(),
                Value<String?> bitisTarihi = const Value.absent(),
                Value<int> aktif = const Value.absent(),
                Value<String?> aciklama = const Value.absent(),
              }) => SayaclarCompanion(
                id: id,
                aboneId: aboneId,
                saatNo: saatNo,
                baslangicEndeks: baslangicEndeks,
                baslangicTarihi: baslangicTarihi,
                bitisEndeks: bitisEndeks,
                bitisTarihi: bitisTarihi,
                aktif: aktif,
                aciklama: aciklama,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int aboneId,
                required String saatNo,
                required double baslangicEndeks,
                required String baslangicTarihi,
                Value<double?> bitisEndeks = const Value.absent(),
                Value<String?> bitisTarihi = const Value.absent(),
                Value<int> aktif = const Value.absent(),
                Value<String?> aciklama = const Value.absent(),
              }) => SayaclarCompanion.insert(
                id: id,
                aboneId: aboneId,
                saatNo: saatNo,
                baslangicEndeks: baslangicEndeks,
                baslangicTarihi: baslangicTarihi,
                bitisEndeks: bitisEndeks,
                bitisTarihi: bitisTarihi,
                aktif: aktif,
                aciklama: aciklama,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SayaclarTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({aboneId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (aboneId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.aboneId,
                                referencedTable: $$SayaclarTableReferences
                                    ._aboneIdTable(db),
                                referencedColumn: $$SayaclarTableReferences
                                    ._aboneIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SayaclarTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SayaclarTable,
      SayaclarData,
      $$SayaclarTableFilterComposer,
      $$SayaclarTableOrderingComposer,
      $$SayaclarTableAnnotationComposer,
      $$SayaclarTableCreateCompanionBuilder,
      $$SayaclarTableUpdateCompanionBuilder,
      (SayaclarData, $$SayaclarTableReferences),
      SayaclarData,
      PrefetchHooks Function({bool aboneId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AyarlarTableTableManager get ayarlar =>
      $$AyarlarTableTableManager(_db, _db.ayarlar);
  $$DonemlerTableTableManager get donemler =>
      $$DonemlerTableTableManager(_db, _db.donemler);
  $$AbonelerTableTableManager get aboneler =>
      $$AbonelerTableTableManager(_db, _db.aboneler);
  $$EndekslerTableTableManager get endeksler =>
      $$EndekslerTableTableManager(_db, _db.endeksler);
  $$TahakkuklarTableTableManager get tahakkuklar =>
      $$TahakkuklarTableTableManager(_db, _db.tahakkuklar);
  $$TahsilatlarTableTableManager get tahsilatlar =>
      $$TahsilatlarTableTableManager(_db, _db.tahsilatlar);
  $$SayaclarTableTableManager get sayaclar =>
      $$SayaclarTableTableManager(_db, _db.sayaclar);
}

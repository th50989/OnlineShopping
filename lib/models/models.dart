import 'dart:convert';

List<MobileModel> mobileModelFromJson(String str) => List<MobileModel>.from(
    json.decode(str).map((x) => MobileModel.fromJson(x)));
String mobileModelToJson(List<MobileModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Nhom {
  String? ten;
  String? maso;
  Nhom({this.ten, this.maso});
  Nhom.fromJson(Map<String, dynamic> json) {
    ten = json['Ten'];
    maso = json['Ma_so'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Ten'] = ten;
    data['Ma_so'] = maso;
    return data;
  }
}

class MobileModel {
  late String id;
  late String ten;
  late String maso;
  late int dongiaBan;
  late int dongiaNhap;
  late Nhom nhom;
  MobileModel(
      {required this.id,
      required this.ten,
      required this.maso,
      required this.dongiaBan,
      required this.dongiaNhap,
      required this.nhom});
  MobileModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    ten = json['Ten'];
    maso = json['Ma_so'];
    dongiaBan = json['Don_gia_Ban'].runtimeType == String
        ? int.parse(json['Don_gia_Ban'])
        : json['Don_gia_Ban'];
    dongiaNhap = json['Don_gia_Nhap'];
    nhom = Nhom.fromJson(json['Nhom']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['Ten'] = ten;
    data['Ma_so'] = maso;
    data['Don_gia_Ban'] = dongiaBan;
    data['Don_gia_Nhap'] = dongiaNhap;
    data['Nhom'] = nhom.toJson();
    return data;
  }
}

List<TiviModel> tiviModelFromJson(String str) =>
    List<TiviModel>.from(json.decode(str).map((x) => TiviModel.fromJson(x)));
String tiviModelToJson(List<TiviModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TiviModel {
  late String id;
  late String ten;
  late String maso;
  late String kyhieu;
  late int dongiaBan;
  late int dongiaNhap;
  late int soluongTon;
  late Nhom nhom;

  TiviModel(
      {required this.id,
      required this.ten,
      required this.maso,
      required this.kyhieu,
      required this.dongiaBan,
      required this.dongiaNhap,
      required this.soluongTon,
      required this.nhom});

  TiviModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    ten = json['Ten'];
    maso = json['Ma_so'];
    kyhieu = json['Ky_hieu'];
    dongiaBan = json['Don_gia_Ban'];
    dongiaNhap = json['Don_gia_Nhap'];
    soluongTon = json['So_luong_Ton'];
    nhom = (json['Nhom'] != null ? Nhom?.fromJson(json['Nhom']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['Ten'] = ten;
    data['Ma_so'] = maso;
    data['Ky_hieu'] = kyhieu;
    data['Don_gia_Ban'] = dongiaBan;
    data['Don_gia_Nhap'] = dongiaNhap;
    data['So_luong_Ton'] = soluongTon;
    data['Nhom'] = nhom.toJson();
    return data;
  }
}

List<FoodModel> foodModelFromJson(String str) =>
    List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));
String foodModelToJson(List<FoodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
  late String id;
  late String ten;
  late String maso;
  late int dongiaBan;
  late Nhom nhom;

  FoodModel(
      {required this.id,
      required this.ten,
      required this.maso,
      required this.dongiaBan,
      required this.nhom});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    ten = json['Ten'];
    maso = json['Ma_so'];

    dongiaBan = json["Don_gia_Ban"];

    nhom = (json['Nhom'] != null ? Nhom?.fromJson(json['Nhom']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['Ten'] = ten;
    data['Ma_so'] = maso;

    data['Don_gia_Ban'] = dongiaBan;

    data['Nhom'] = nhom.toJson();
    return data;
  }
}

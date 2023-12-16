import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/crud/values.dart';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var url = Uri.parse('${Value.baseUrl}insertUser');
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: convert.jsonEncode({
      "Ho_ten": "Thanh Hoang",
      "Ma_so": "QL_101",
      "Ten_Dang_nhap": "th50989",
      "Mat_khau": "123456",
      "Nhom_Nguoi_dung": {"Ten": "Nhân viên Quản lý", "Ma_so": "QUAN_LY"}
    }),
  );
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    debugPrint('resulst: $jsonResponse.');
  }
}

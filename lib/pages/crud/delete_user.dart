import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/crud/values.dart';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var url = Uri.parse('${Value.baseUrl}deleteUser');
  var response = await http.delete(
    url,
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: convert.jsonEncode({"Ma_so": "QL_100"}),
  );
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    debugPrint('resulst: $jsonResponse.');
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
  }
}

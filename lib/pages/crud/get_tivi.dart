import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/crud/values.dart';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var url = Uri.parse('${Value.baseUrl}lstTivi');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse.length.toString();
    debugPrint('Number of User about http: $itemCount.');
    // for (int i = 0; i < int.parse(itemCount); i++) {
    //   debugPrint(response.toString());
    // }
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
  }
}

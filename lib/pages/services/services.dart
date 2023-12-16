import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/pages/crud/values.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  Future<List<MobileModel>?> getMobiles() async {
    Response response;
    try {
      var url = Uri.parse(Value.baseUrl + Value.mobileEndpoint);
      debugPrint(url.toString());
      response = await http.get(url);
      //debugPrint(response.body.toString());
      //debugPrint('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        List<MobileModel> model = mobileModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<TiviModel>?> getTivis() async {
    Response response;
    try {
      var url = Uri.parse(Value.baseUrl + Value.tiviEndpoint);
      debugPrint(url.toString());
      response = await http.get(url);
      debugPrint('Lay du lieu thanh cong ');
      //debugPrint(response.body.toString());
      //debugPrint('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        List<TiviModel> model = tiviModelFromJson(response.body);
        debugPrint('bind du lieu thanh cong');
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<FoodModel>?> getFoods() async {
    Response response;
    try {
      var url = Uri.parse(Value.baseUrl + Value.foodEndpoint);
      debugPrint(url.toString());
      response = await http.get(url);
      //debugPrint(response.body.toString());
      //debugPrint('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        List<FoodModel> model = foodModelFromJson(response.body);
        debugPrint(model.toString());
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

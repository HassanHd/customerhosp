import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class FieldsController with ChangeNotifier {
  List<String> priceslist = [];
  List<String> companieslist = [];

  getFields() async {
    companieslist = [];
    priceslist = [];
    try {
      var url = Uri.parse(
          "https://el-mostashfa.com/Api/careAPI/api/SearchFields");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      var responseBody = jsonDecode(response.body)["response"]["data"];
      print(responseBody);
      for (var i in responseBody["companies"]) {
        companieslist.add(i["label"]);
      }
      for (var i in responseBody["prices"]) {
        priceslist.add(i["label"]);
      }
    } catch (e) {
      print(e);
    }
  }

  FieldsController() {
    getFields().then((valu) {
      notifyListeners();
    });
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
class ProfileController {
  static getProfile() async {

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      var url =
      Uri.parse("https://el-mostashfa.com/Api/careAPI/api/get_profile?id=${pref.getString("id")}");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      var responseBody = jsonDecode(response.body)["response"]["data"];
      print(responseBody);
return responseBody;
    } catch (e) {
      print(e);

    }
  }
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
class EditProfileController {
  static getEditProfile(
      {
    required String firstName,
    required String lastName,
    required String mobile,
    required String email,
    required String phone2,
    required String address,
    required String city,
    required String country,
  }) async {

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var url =
      Uri.parse("https://el-mostashfa.com/Api/careAPI/api/changeProfile?id=${pref.getString("id")}&firstName=$firstName&lastName=$lastName&mobile=$mobile&email=$email&phone2=$phone2&address=$address&city=$city&country=$country");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      var responseBody = jsonDecode(response.body)["response"]["data"];
      print("responseBody--$responseBody");
      print("statusCode---${response.statusCode}");
      return responseBody;
    } catch (e) {
      print(e);

    }
  }
  static imageEditProfile(
      {required var image,}) async {

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String id =pref.getString("id").toString();
      var url =
      Uri.parse("https://el-mostashfa.com/Api/careAPI/api/uploadImage");
      print("uploadImage ***> $url");
      final response = await http.post(url,
      body:{
        "id":id,
        "image":image
      }
      );
      print(response.body.toString());
      var responseBody = jsonDecode(response.body);
      print("responseBodyimage--$responseBody");
      print("statusCode---${response.statusCode}");
      return responseBody;
    } catch (e) {
      print(e);

    }
  }
}
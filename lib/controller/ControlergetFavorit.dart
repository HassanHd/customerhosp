import 'package:customerapp/model/Doctors.dart';
import 'package:customerapp/model/Specialty.dart';
import 'package:customerapp/model/favorite.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ControlergetFavorit {
  static Future<List<Doctors>> getFavorit() async {
    List<Doctors> listDataModel = [];
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString("id").toString();
    print("objectf---->");
    try {
      var url = Uri.parse(
          "https://el-mostashfa.com/Api/careAPI/api/getFavorit?user_id=$id");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      var responseBody = jsonDecode(response.body)["response"]["data"];
      print(responseBody);
      for (int i = 0; i < responseBody.length; i++) {
        listDataModel.add(Doctors.fromMap(responseBody[i]));
      }
      return listDataModel;
    } catch (e) {
      print(e);
      return listDataModel;
    }
  }

  static setFavorit(String provider_id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString("id").toString();
    print("objectf---->");
    try {
      var url = Uri.parse(
          "https://el-mostashfa.com/Api/careAPI/api/setFavorit?user_id=$id&provider_id=$provider_id");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      var responseBody = jsonDecode(response.body)["response"]["status"];

      print(responseBody);
      if (responseBody.toString() == "1") {
        return "1";
      }
    } catch (e) {
      print(e);
      return "0";
    }
  }

  static DeleteFavorit(String provider_id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString("id").toString();
    print("objectf---->");
    try {
      var url = Uri.parse(
          "https://el-mostashfa.com/Api/careAPI/api/DeleteFavorit?user_id=$id&provider_id=$provider_id");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      var responseBody = jsonDecode(response.body)["response"]["status"];

      print(responseBody);
      if (responseBody.toString() == "1") {
        return "1";
      }
    } catch (e) {
      print(e);
      return "0";
    }
  }
}

import 'package:customerapp/model/Specialty.dart';
import 'package:customerapp/model/history.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ControllerHistory{
  static Future<List<history>> getHistory(String field) async {
    List<history> listDataModel = [];
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id=pref.getString("id").toString();
    print("objectf---->");
    try {
      var url =
      // Uri.parse("https://el-mostashfa.com/Api/careAPI/api/get_history?field=Analysis&id=4");
      Uri.parse("https://el-mostashfa.com/Api/careAPI/api/get_history?field=$field&id=$id");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      var responseBody = jsonDecode(response.body)["response"]["history"];
      print(responseBody);
      for (int i = 0; i < responseBody.length; i++) {
        listDataModel.add(history.fromMap(responseBody[i]));
      }
      return listDataModel;
    } catch (e) {
      print(e);
      return listDataModel;
    }
  }


}
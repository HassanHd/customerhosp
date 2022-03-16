
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddAttachedContoller with ChangeNotifier {
  bool Error = true;
  bool Loading = true;

  fetchAddAttached({required String field,required String title,required String description,required var attached_file}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
   String id=pref.getString("id").toString();
    var url = Uri.parse(
        "https://el-mostashfa.com/Api/careAPI/api/set_history");
    print(url);
    var response = await http.post(url,
        body: {
          "field":"$field",
          "title":"$title",
          "user_id":"$id",
          "description":"$description",
          "attached_file":"$attached_file",
        }

    );
    if (response.statusCode == 200) {
      try {
        var responsebody = jsonDecode(response.body);
        if (responsebody == 0) {
          Loading = false;
          Error = false;
          notifyListeners();

        }
      } catch (e) {
        Loading = false;
        Error = true;
        notifyListeners();
      }
    } else {
      Loading = false;
      Error = true;
      notifyListeners();

    }
  }
}
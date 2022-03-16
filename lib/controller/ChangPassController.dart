import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangPassController with ChangeNotifier {
  bool Error = true;
  bool Loading = true;

  fetchChangPass({required String oldPassword, required String newPassword}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
      String id=pref.getString("id").toString();
    var url = Uri.parse(
        "https://el-mostashfa.com/Api/careAPI/api/changePass?id=$id&password=$newPassword&oldpassword=$oldPassword");
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        var responsebody = jsonDecode(response.body)["response"];
        if (responsebody["status"] == 1) {
          Loading = false;
          Error = false;
          notifyListeners();
        }
        else{
          Loading = false;
          Error = true;
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

import 'package:customerapp/view/screens/bottom_nav/HomeTapScreen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginControler with ChangeNotifier {
  bool Error = true;
  bool Loading = true;

  fetchLogin({required String mobile, required String password,required String Codemobile,var context}) async {
    var url = Uri.parse(
        "https://el-mostashfa.com/Api/careAPI/api/login?mobile=$mobile&password=$password");
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        var responsebody = jsonDecode(response.body)["response"];
        if (responsebody["status"] == 1) {
          print("responsebody$responsebody");
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("id", responsebody["data"]["ID"].toString());
          print(responsebody["data"]["ID"].toString());

          Loading = false;
          Error = false;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(

            content: Text('Login completed successfully , Welcome back'),
          ));

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                      HomeTapScreen()),
                  (Route<dynamic> route) => false);
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

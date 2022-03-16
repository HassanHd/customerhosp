import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupControler with ChangeNotifier {
  bool Error = true;
  bool Loading = true;

  fetchSignup({required String firstName,required String lastName,required String email,required String mobile, required String password}) async {

    var url = Uri.parse(
        "https://el-mostashfa.com/Api/careAPI/api/register");
    print(url);
    var response = await http.post(url,
    body: {
      "firstName":"$firstName",
      "lastName":"$lastName",
      "mobile":"$mobile",
      "email":"$email",
      "password":"$password",
    }

    );
    if (response.statusCode == 200) {
      try {
        var responsebody = jsonDecode(response.body)["response"]["status"];
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
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AmbulanceContrroller with ChangeNotifier {
  bool Error = true;
  bool Loading = true;

  fetchAmbulance({
    required String SpecializationNmae,
    required String SpecializationId,
    required String Address,
    required String city,
    required String lat,
    required String long,
    required String country,
    required String name,
    required String phone,

  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id=pref.getString("id").toString();
    var url =
    Uri.parse("https://el-mostashfa.com/Api/careAPI/api/setambulance");
    print(url);
    var response = await http.post(url, body: {
      "id": "$id",
      "SpecializationNmae": "$SpecializationNmae",
      "SpecializationId": "$SpecializationId",
      "Address": "$Address",
      "city": "$city",
      "lat": "$lat",
      "long": "$long",
      "country": "$country",
      "name": "$name",
      "phone": "$phone",

    });
    var responsebody =jsonDecode(response.body);
    print(responsebody);
    if (response.statusCode == 200) {
      try {
        var responsebodystatus = jsonDecode(response.body)["response"]["status"];
        print(responsebodystatus);
        if (responsebodystatus.toString() == "1") {
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

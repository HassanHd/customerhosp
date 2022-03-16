import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HealthCareContrroller with ChangeNotifier {
  bool Error = true;
  bool Loading = true;

  fetchHealthCare({
    required String SpecializationNmae,
    required String SpecializationId,
    required String Address,
    required String city,
    required String lat,
    required String long,
    required String country,
    required String Isolation,
    required String MedicalInsurance,
    required String Medicalinsurancecompanies,
    required String Medicaldetails,
    required String MedicalDetailsNote,
    required String Expectedprice,
    required String type,
    required String attachTitle,
    required String attachDesc,
    required String attach,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id=pref.getString("id").toString();
    var url =
        Uri.parse("https://el-mostashfa.com/Api/careAPI/api/setHealthCare");
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
      "Isolation": "$Isolation",
      "MedicalInsurance": "$MedicalInsurance",
      "Medicalinsurancecompanies": "$Medicalinsurancecompanies",
      "Medicaldetails": "$Medicaldetails",
      "MedicalDetailsNote": "$MedicalDetailsNote",
      "Expectedprice": "$Expectedprice",
      "type": "$type",
      "attachTitle": "$attachTitle",
      "attachDesc ": "$attachDesc",
      "attach": "$attach",
    });
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    if (response.statusCode == 200) {
      try {
        var responsebody = jsonDecode(response.body)["response"]["status"];
        print(responsebody);
        if (responsebody == 1) {
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

import 'package:customerapp/model/Doctors.dart';
import 'package:customerapp/model/Specialty.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ControlerDoctors{
  static Future<List<Doctors>> getDoctors(
      {String country="", String city ="",String catid ="",String price="",}) async {
    if(catid!="Select Specialty"){
      catid=catid.split(',')[1];
    }else{
      catid="";
    }
    if(country=="Select Country"){
country="";
    }
    if(city==null){
      city="";
    }
    if(price==null){
      price="";
    }
    List<Doctors> listDataModel = [];
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id=pref.getString("id").toString();
    print("objectf---->");
    try {
      var url =
      Uri.parse("https://el-mostashfa.com/Api/careAPI/api/search?id=$id&country=$country&city=$city&catid=$catid&price=$price");
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


}
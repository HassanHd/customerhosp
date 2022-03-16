import 'package:customerapp/model/Specialty.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ControlerSpecialty{
 static Future<List<Specialty>> getSpecialty() async {
    List<Specialty> listDataModel = [];

    print("objectf---->");
    try {
      var url =
      Uri.parse("https://el-mostashfa.com/Api/careAPI/api/specialization");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      var responseBody = jsonDecode(response.body)["response"]["data"];
      print(responseBody);
      for (int i = 0; i < responseBody.length; i++) {
        listDataModel.add(Specialty.fromMap(responseBody[i]));
      }
      return listDataModel;
    } catch (e) {
      print(e);
      return listDataModel;
    }
  }


}
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UploadAttachmentControler with ChangeNotifier {
  bool Error = true;
  bool Loading = true;

  fetchUploadAttachment({required String field,required String title,required String description,required String attached_file,}) async {

    var url = Uri.parse("https://el-mostashfa.com/Api/careAPI/api/set_history");
    print(url);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id=pref.getString("id").toString();
    var response = await http.post(url,
        body: {
          "field":"$field",
          "user_id":"$id",
          "title":"$title",
          "description":"$description",
          "attached_file":"$attached_file",
        }

    );
    print("statusCode---${response.statusCode}");
    print("field:${field}");
    print("user_id:$id");
    print("title:${title}");
    print("description:${description}");
    print("attached_file:${attached_file}");
    var responsebody = jsonDecode(response.body);
    print("responseBody--$responsebody");
    if (response.statusCode == 200) {

      try {
        var responsebody = jsonDecode(response.body);
        print("responseBody--$responsebody");
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
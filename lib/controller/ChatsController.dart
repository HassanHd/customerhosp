import 'package:customerapp/model/Chats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ChatsController with ChangeNotifier {
  List<Chats> Chatslist = [];

  getChats() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Chatslist = [];
    try {
      var url = Uri.parse(
          "https://el-mostashfa.com/Api/careAPI/api/getChatRooms?senderId=${pref.getString("id")}");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      var responseBody = jsonDecode(response.body)["response"]["data"];
      print(responseBody);
      for (var i in responseBody) {
        Chatslist.add(Chats.fromMap(i));
      }

    } catch (e) {
      print(e);
    }
  }

  ChatsController() {
    getChats().then((valu) {
      notifyListeners();
    });
  }
}

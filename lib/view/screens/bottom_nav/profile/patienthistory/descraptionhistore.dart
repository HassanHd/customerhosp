import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:customerapp/constant.dart';
import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class DescraptionScreen extends StatefulWidget {
  String title;
  String type;
  String attached_file;
  String date;
  String description;
  String id;

  @override
  _DescraptionScreenState createState() => _DescraptionScreenState();

  DescraptionScreen({
    required this.title,
    required this.type,
    required this.attached_file,
    required this.date,
    required this.id,
    required this.description,
  });
}

class _DescraptionScreenState extends State<DescraptionScreen> {
  void opinurl(String url) async {
    var urllanch = url;
    if (await canLaunch(urllanch)) {
      await launch(urllanch);
    } else {
      await launch(urllanch);
    }
  }

  fetchdelet(String hid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString("id").toString();
    var url = Uri.parse(
        "https://el-mostashfa.com/Api/careAPI/api/deleteHistory?id=$hid&userId=$id");
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        var responsebody = jsonDecode(response.body)["response"];
        if (responsebody["status"] == 1) {
          Navigator.of(context).pop(true);

        } else {}
      } catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Medical Analysis",
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primarydarkcolor,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, bottom: 8),
            child: Text(
              "${widget.title}",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, bottom: 8),
            child: Text(
              DateFormat.yMMMd().format(DateTime.parse("${widget.date}")),
              style: TextStyle(
                  fontSize: 16,
                  color: primarydarkcolor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, bottom: 8),
            child: Text(
              "${widget.description}",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  flex: 45,
                  child: CustomButton(
                    text: 'Open File ',
                    onPressed: () {
                      opinurl("${widget.attached_file}");
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 45,
                  child: CustomButton(
                    text: 'Delete',
                    color: red,
                    onPressed: () {

                      fetchdelet( "${widget.id}");
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

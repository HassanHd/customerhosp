import 'package:customerapp/view/screens/bottom_nav/HomeTapScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginscreen.dart';
class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  _CheckScreenState createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  checkid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getString("id").toString()=="null"){
      print(pref.getString("id").toString());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Welcome back'),
      ));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  LoginScreen()),
              (Route<dynamic> route) => false);
    }else{
      print(pref.getString("id").toString());

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  HomeTapScreen()),
              (Route<dynamic> route) => false);
    }

  }
  @override
  void initState() {
    checkid();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

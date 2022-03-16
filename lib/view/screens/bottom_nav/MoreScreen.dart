import 'package:customerapp/view/screens/auth/loginscreen.dart';
import 'package:customerapp/view/widgets/ContainerWithimg.dart';
import 'package:customerapp/view/widgets/ContainerWithoutrouts.dart';
import 'package:customerapp/view/widgets/webchat.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant.dart';
class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        centerTitle: true,
        title: Text('More'),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              children: <Widget>[
                ContainerWithimg(text:"Our Partners",img:"assets/icons/hand.svg",screen: "OurPartners",),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InAppchat()),
                    );
                  },
                  child: ContainerWithoutrouts(
                      text: "Support",
                      img: "assets/icons/supert.svg"),
                ),
                GestureDetector(
                  onTap: () async {
                    if (EasyLocalization.of(context)!.locale ==
                        Locale('en', 'EN')) {

                      context.locale = Locale('ar', 'AR');


                      // EasyLocalization.of(context).locale =
                      //     Locale('ar', 'AR');
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.setString("lang", "ar_AR");
                      prefs.setInt("langchack", 1);
                    }
                    // EasyLocalization.of(context).locale=Locale('en','EN');
                    else if (EasyLocalization.of(context)!.locale ==
                        Locale('ar', 'AR')) {
                      context.locale = Locale('en', 'EN');

                      // EasyLocalization.of(context).locale =
                      //     Locale('en', 'EN');
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.setString("lang", "en_EN");
                      prefs.setInt("langchack", 1);
                    }
                  },
                  child: ContainerWithoutrouts(
                      text: "Change Language",
                      img: "assets/icons/lang.svg"),
                ),
                ContainerWithimg(
                    text: "Privacy Policy",
                    img: "assets/icons/privacy.svg",
                    screen: "terms"),
                ContainerWithimg(
                    text: "Terms & Conditions",
                    img: "assets/icons/terms.svg",
                    screen: "terms"),
                ContainerWithimg(
                  text: "F&Q",
                  img: "assets/icons/faq.svg",
                  screen: "FAQScreen",
                ),
                GestureDetector(
                    onTap: () async {
                      print("hi---");
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      preferences.remove("uuid");
                      preferences.remove("langchack");
                      await preferences.clear();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child:ContainerWithoutrouts(
                      text: "Logout",
                      img: "assets/icons/logout.svg",
                    )



                )


              ],
            ),
          ),
        ],
      ),
    );
  }
}

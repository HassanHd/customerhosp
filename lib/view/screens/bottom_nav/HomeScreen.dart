import 'package:carousel_slider/carousel_slider.dart';
import 'package:customerapp/view/widgets/ContainerWithimg.dart';
import 'package:customerapp/view/widgets/ContainerWithoutrouts.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:customerapp/view/widgets/webchat.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../../constant.dart';
import 'home/Doctors/DoctorListScreen.dart';
import 'home/HealthCare/HealthCareScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imgList = [
    'assets/icons/fahd.jpeg',
    'assets/icons/fahd3.jpg',
    'assets/icons/fahd4.jpg',
  ];
  final _listViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,

      body: CustomScrollView(
        key: _listViewKey,
        slivers: <Widget>[
          // SliverToBoxAdapter(
          //     child: Padding(
          //       padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.11),
          //       child: CarouselSlider(
          //           items: imgList.map((imageUrl) {
          //             return Container(
          //               width:MediaQuery.of(context).size.width,
          //               //margin: EdgeInsets.symmetric(horizontal: 10),
          //               child: Image.asset(
          //                 imageUrl,
          //                 fit: BoxFit.fill,
          //                 width: double.infinity,
          //               ),
          //
          //             );
          //           }).toList(),
          //           options: CarouselOptions(
          //             height: MediaQuery.of(context).size.height/3.5,
          //             initialPage: 0,
          //             enlargeCenterPage: true,
          //             autoPlay: true,
          //             autoPlayInterval: Duration(seconds: 2),
          //             onPageChanged: (index, _) {
          //               setState(() {
          //
          //               });
          //             },
          //           )),
          //
          //       // Image.asset("assats/images/homeimage.jpg"),
          //     )),

          SliverPadding(
            // padding: const EdgeInsets.all(20),
                   padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.11,horizontal: 20),

            sliver: SliverGrid.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              children: <Widget>[
                ContainerWithimg(text:"Consultations",img:"assets/icons/doctor.svg",screen: "DoctorSearchScreen",),
                ContainerWithimg(text:"Find Hospital",img:"assets/icons/hospital.svg",screen: "HealthCareScreen",),
                ContainerWithimg(text:"Home visit",img:"assets/icons/home.svg",screen: "HomeVisitSearchScreen",),
                ContainerWithimg(text:"Ambulance",img:"assets/icons/ambulance.svg",screen: "AmbulanceScreen",),
                ContainerWithimg(text:"Chats",img:"assets/icons/chat.svg",screen: "ChatsScreen",),
                GestureDetector(
                  onTap: () async {
                    UrlLauncher.launch('tel:+01018440919');
                  },
                  child: ContainerWithoutrouts(
                      text: "Call",
                      img: "assets/icons/call.svg"),
                ),



              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InAppchat()),
            );
          },
          child: Icon(Icons.chat),
          backgroundColor: primarydarkcolor,
          elevation: 5,
        ),
      ),
    );
  }
}


import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'HomeScreen.dart';
import 'MoreScreen.dart';
import 'ProfileScreen.dart';
class HomeTapScreen extends StatefulWidget {
  const HomeTapScreen({Key? key}) : super(key: key);

  @override
  _HomeTapScreenState createState() => _HomeTapScreenState();
}

class _HomeTapScreenState extends State<HomeTapScreen> {
  int selectedpage =0;
  final _pageOptions = [HomeScreen() ,ProfileScreen(),MoreScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: textblue,
        // floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 20.0),
        //   child: FloatingActionButton(
        //     onPressed: () {  },
        //     child: Icon(Icons.chat),
        //     backgroundColor: primarydarkcolor,
        //     elevation: 5,
        //   ),
        // ),
        body: _pageOptions[selectedpage],

        bottomNavigationBar: ConvexAppBar(

          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.person, title: 'Profile'),
            TabItem(icon: Icons.settings, title: 'More'),
          ],
          initialActiveIndex: selectedpage,
          onTap: (int index){
            setState(() {
              selectedpage = index;
            });
          },
        )
    );
  }
}

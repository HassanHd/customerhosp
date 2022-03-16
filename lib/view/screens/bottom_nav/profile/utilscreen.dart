import 'package:customerapp/view/widgets/ContainerWithimg.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../constant.dart';
class UtilesScreen extends StatefulWidget {
  const UtilesScreen({Key? key}) : super(key: key);

  @override
  _UtilesScreenState createState() => _UtilesScreenState();
}

class _UtilesScreenState extends State<UtilesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
              children: <Widget>[
                ContainerWithimg(text:"Patient History",img:"assets/icons/histore.svg",screen: "mypatienthistory",),
                ContainerWithimg(text:"Favourites",img:"assets/icons/heart.svg",screen: "FavouritesScreen",),
                ContainerWithimg(text:"Booking",img:"assets/icons/booking.svg",screen: "BookingScreen",),
                ContainerWithimg(text:"Change Password",img:"assets/icons/changpass.svg",screen: "ChangePasswordScreen",),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

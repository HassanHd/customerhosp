import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../constant.dart';
class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: textblue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,

          title: CustomText(
            text: "Booking",
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


    );
  }
}

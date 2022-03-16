import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant.dart';
import 'nave.dart';
import 'package:easy_localization/easy_localization.dart';

class ContainerWithoutrouts extends StatelessWidget {
  final double circleRadius = 50.0;
  final double circleBorderWidth = 8.0;
  String? text;
  String? img;


  ContainerWithoutrouts({this.text, this.img});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          height: 130.0,
          width: 200,
          padding: EdgeInsets.only(top: circleRadius - 20, right: 5, left: 5),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Center(
                child: Text(
                  "$text".tr().toString(),
                  style: TextStyle(fontSize: 17, color: textcolor),
                )),
            //replace this Container with your Card
            color: Colors.white,
          ),
        ),
        Container(
          height: 60,
          width: 60,
          child: Card(
            // padding:EdgeInsets.all(5),
            elevation: 5,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            color: primarydarkcolor,

            child: Container(
              padding: EdgeInsets.all(9),
              child: SvgPicture.asset(
                "$img",
              ),
            ),
          ),
        )
      ],
    );
  }
}

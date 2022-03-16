import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant.dart';
import 'nave.dart';
import 'package:easy_localization/easy_localization.dart';

class ContainerWithimg extends StatelessWidget {
  final double circleRadius = 50.0;
  final double circleBorderWidth = 8.0;
  String? text;
  String? img;
  String? screen;


  ContainerWithimg({this.text, this.img,this.screen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigationKey!.currentState!.pushNamed(
          "$screen",

        );
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            height: 130.0,

            padding: EdgeInsets.only(top: circleRadius - 20, right: 5, left: 5),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Center(
                  child: Text(
                    "$text".tr().toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: textcolor),
                  )),
              //replace this Container with your Card
              color: Colors.white,
            ),
          ),
          Container(
            height: 65,
            width: 65,
            child: Card(
              // padding:EdgeInsets.all(5),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: primarydarkcolor,

              child: Container(
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "$img",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

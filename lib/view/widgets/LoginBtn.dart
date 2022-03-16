import 'package:flutter/material.dart';

import 'GWidgets.dart';

Widget buildLoginContainer(BuildContext context,String text) =>
    Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      child: Stack(
        children: [
          buildLoginBtn(text),
        ],
      ),
    );

Widget buildLoginBtn(String text) => Positioned(
      right: -100,
      child: Container(
        width: 350,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.00),
          color: Color.fromRGBO(81, 165, 243, 1),
        ),
        child: buildLoginText(text),
      ),
    );

Widget buildLoginText(String text) => Row(
      children: [
        widthSpacer(75.00),
        Text(
          "$text",
          style: TextStyle(color: Colors.white, fontSize: 20.00),
        ),
        widthSpacer(5.5),
        Icon(
          Icons.navigate_next,
          color: Colors.white,
        )
      ],
    );

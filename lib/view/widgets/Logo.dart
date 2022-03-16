
import 'package:flutter/material.dart';

import 'GWidgets.dart';
import 'ImagesFiles.dart';

Widget buildLogoField() => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLogoImage(4),
          widthSpacer(10.00),
          buildLogoText("vijaycreations")
        ],
      ),
    );
Widget buildLogoImage(int imageIndex) => Container(
      width: 45,
      height: 45,
      child: Image.asset(
        loginPageImages[imageIndex],
        fit: BoxFit.contain,
      ),
    );
Widget buildLogoText(String logoText) => Text(
      logoText,
      style: TextStyle(fontSize: 25.00),
    );

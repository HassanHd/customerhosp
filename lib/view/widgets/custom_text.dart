import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomText extends StatelessWidget {
    final String text;
    final double fontSize;
    final Color color;
    final Alignment alignment;
    final TextAlign textAlign;
    final FontWeight fontWeight ;


  CustomText({this.text =" ",
    this.fontSize =16,
    this.color = Colors.black,
    this.alignment = Alignment.center,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text.tr().toString(),
         textAlign: textAlign,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          fontWeight:fontWeight,
        ),
      );
  }
}

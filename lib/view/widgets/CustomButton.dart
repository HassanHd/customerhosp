import 'package:flutter/material.dart';
import '../../constant.dart';
import 'custom_text.dart';
class CustomButton extends StatelessWidget {

  final String text;
  var onPressed;
  final Color color;



  CustomButton({this.text=" ", this.onPressed,this.color=primarydarkcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  MaterialButton(
          onPressed:onPressed,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          padding: EdgeInsets.all(20),
          color:color ,
          child: Container(
            width:  MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: CustomText(
              text: text,
              color:Colors.white ,
              alignment: Alignment.center,
            ),
          )

      ),
    );
  }
}

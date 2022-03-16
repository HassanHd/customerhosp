import 'package:flutter/material.dart';

const primarycolor=Color(0xffFFFFFF);
const primarybrowndark=Color(0xff8D2D15);
const textcolor=Color(0xff000000);
const textblue=Color(0xffE8F5FF);
const butcolor=Color(0xffC06818);
const gray=Color(0xff828282);
const grayborder=Color(0xffCCC7C7);
const backtextfild=Color(0xffF3F3F3);
const backtextfildcir=Color(0xffF4F4F6);
const graytext=Color(0xff9F9D9B);
const bordercolor=Color(0xffB1B0B0);
const primarydarkcolor=Color(0xff2D87FF);
const white=Color(0xffffffff);
const appcolor=Color(0xffffd800);
const red=Color.fromRGBO(246,50, 50, 1);
const orangelight=Color.fromRGBO(255,162, 0, 1);
const yellow=Color.fromRGBO(255,193, 7, 1);
const orangedark=Color.fromRGBO(255,85, 0, 1);
const blue=Color.fromRGBO(45,95,255, 1);
const green=Color.fromRGBO(0,198,105, 1);
const black=Color.fromRGBO(0,0,0,1);
const newvv=LinearGradient(
  begin: Alignment(0.0, -1.0),
  end: Alignment(0.0, 1.0),
  colors: [
    const Color(0xff3FB8C0),
    const Color(0xff0399A0)
  ],
);
const double fonttitel=14;
const double fontSmall=13;
const double fontsubtitel=14;
const double SizedBoxheight=10;
const headerStyle = TextStyle(fontSize: 35, fontWeight: FontWeight.w900);
const subHeaderStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700,color:Colors.grey );
const bodyTextStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);
const bodyLabelStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);

Widget horizontalLine(double lineWidth,
    {double lineHeight = 1, Color color = Colors.grey}) {
  return Container(
    height: lineHeight,
    width: lineWidth,
    color: color,
  );
}


TextStyle? clickableCaption(context){
  return Theme.of(context).textTheme.caption?.copyWith(color: Theme.of(context).accentColor,fontSize:15,fontWeight: FontWeight.w600 );
}
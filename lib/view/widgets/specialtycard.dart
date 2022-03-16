import 'package:customerapp/view/screens/bottom_nav/home/HealthCare/HealthCareScreen.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
class SpecialtyCard extends StatefulWidget {
  Color Containercolor;
   // String image;
   String name;
  String id;



  @override
  _SpecialtyCardState createState() => _SpecialtyCardState();

  SpecialtyCard({
    required this.Containercolor,
    required this.name,
    required this.id,
  });
}

class _SpecialtyCardState extends State<SpecialtyCard> {
  List chick = Specialtychick;


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        print("onTap");

        setState(() {
          print("setState");

          if (widget.Containercolor == primarydarkcolor) {
            print("transparent");
            widget.Containercolor = Colors.transparent;
          } else {
            print("primarydarkcolor");

            widget.Containercolor = primarydarkcolor;
          }
          Specialtychick
              .add(widget.id);
        });
      },
      child: Container(
        color:widget.Containercolor ,
        margin:const EdgeInsets.all(2.0),
        padding: const EdgeInsets.all(2.0),
        child: Text("${widget.name}"),
      ),
    );
  }
}

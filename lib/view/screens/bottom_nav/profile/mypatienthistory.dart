import 'package:customerapp/view/screens/bottom_nav/profile/patienthistory/addptionhestory.dart';
import 'package:customerapp/view/widgets/ContainerWithimg.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../../../constant.dart';

class mypatienthistory extends StatefulWidget {
  const mypatienthistory({Key? key}) : super(key: key);

  @override
  _mypatienthistoryState createState() => _mypatienthistoryState();
}

class _mypatienthistoryState extends State<mypatienthistory> {
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    backgroundColor: textblue,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,

      title: CustomText(
        text: "Patient History",
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
    floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
    floatingActionButton: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return AddPationhistory();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: primarydarkcolor,
        elevation: 5,
      ),
    ),

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
                ContainerWithimg(text:"Medical Analysis",img:"assets/icons/hand.svg",screen: "AnalysisScreen",),
                ContainerWithimg(text:"Reports",img:"assets/icons/hand.svg",screen: "Reports",),
                ContainerWithimg(text:"Medical Radiology",img:"assets/icons/supert.svg",screen: "RadiologyScreen",),
                ContainerWithimg(text:"Drescriptions",img:"assets/icons/supert.svg",screen: "PrescriptionsSearchScreen",),
              ],
            ),
          ),
        ],
      ),
    );

  }
}

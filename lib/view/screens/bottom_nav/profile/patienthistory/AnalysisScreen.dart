import 'package:customerapp/controller/ControllerHistory.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../constant.dart';
import 'descraptionhistore.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: CustomText(
            text: "Medical Analysis",
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
        backgroundColor: textblue,
        body: FutureBuilder(
        future: ControllerHistory.getHistory("Analysis"),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasData) {
    print("snapshot.data----");
    print(snapshot.data.isNotEmpty);
    if (snapshot.data.isNotEmpty == true) {
    return Timeline.builder(
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
    return TimelineModel(
    Card(
    margin: EdgeInsets.symmetric(vertical: 16.0),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0)),
    clipBehavior: Clip.antiAlias,
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      ("${snapshot.data[index].type}"== "image" ) ? Image.network(

        "${snapshot.data[index].attached_file}",
      ):Image.network(
        "https://el-mostashfa.com/Api/careAPI/uploads/assets/pdf.png",
      ),
    const SizedBox(
    height: 8.0,
    ),
    Text(
      DateFormat.yMMMd().format(DateTime.parse(snapshot.data[index].date)) ,
    ),
    const SizedBox(
    height: 5.0,
    ),
    Text(
    "${snapshot.data[index].title}",
    textAlign: TextAlign.center,
    ),
    const SizedBox(
    height: 8.0,
    ),
    ],
    ),
    ),
    ),
    onTap: () {
    

  
    Navigator.push(context,
    MaterialPageRoute(builder: (BuildContext context) {
    return DescraptionScreen(description:"${snapshot.data[index].description}", date: "${snapshot.data[index].date}", type: "${snapshot.data[index].type}", attached_file:"${snapshot.data[index].attached_file}", title:"${snapshot.data[index].title}", id: "${snapshot.data[index].id}",);
    })).then((value) {
      setState(() {

      });
    });
    },
    icon: Icon(Icons.receipt, color: Colors.white),
    iconBackground: Colors.blue,
    );
    },
    position: TimelinePosition.Center,
    iconSize: 40,
    lineColor: Colors.blue,
    ); } else {
    return Center(
    child: Text("You do not have any information stored before"));
    }
    } else {
    return Center(child: CircularProgressIndicator());
    }
  }

  ,

  )

  ,

  );
}}

import 'package:customerapp/controller/controllerdoctores.dart';
import 'package:customerapp/view/widgets/CustomCard.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import 'profiledoctor.dart';

class DoctorListScreen extends StatefulWidget {
  String country ;
  String city ;
  String catid;
  String prices;


  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();

  DoctorListScreen({
     this.country="",
     this.city="",
     this.catid="",
     this.prices="",

  });
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Consultations",
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
      body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FutureBuilder(
            future: ControlerDoctors.getDoctors(catid:widget.catid ,city:widget.city,country:widget.country,price:widget.prices , ),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ProfileDoctor(snapshot.data[index]);
                          }));
                        },
                        child: CustomCard(snapshot.data[index]));
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )

      ),
    );
  }
}

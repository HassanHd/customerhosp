import 'package:flutter/material.dart';
import 'package:customerapp/controller/ControlerSpecialty.dart';
import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:customerapp/view/widgets/specialtycard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../constant.dart';
import 'HomeVisitTwo.dart';

class HomeVisitSearchScreen extends StatefulWidget {
  const HomeVisitSearchScreen({Key? key}) : super(key: key);

  @override
  _HomeVisitSearchScreenState createState() => _HomeVisitSearchScreenState();
}

List Specialtychick = [];

class _HomeVisitSearchScreenState extends State<HomeVisitSearchScreen> {
// value set to false
  var radioItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Home Visit",
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
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
              child: CustomText(
                text: "Home Visit",
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: FutureBuilder(
                future: ControlerSpecialty.getSpecialty(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return (snapshot.hasData)
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RadioListTile(
                                groupValue: radioItem,
                                value: snapshot.data[index].toString(),
                                activeColor: primarycolor,
                                title: Text(
                                  snapshot.data[index].name,
                                ),
                                onChanged: (Object? value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeVisitTwo(
                                              idMedicalSpecialty:
                                                  '${snapshot.data[index].id}',
                                              MedicalSpecialty:
                                                  '${snapshot.data[index].name}',
                                            )),
                                  );
                                });
                          },
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
          ],
        ),
      ),
    );
  }
}

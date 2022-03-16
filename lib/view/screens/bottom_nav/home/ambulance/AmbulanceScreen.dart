import 'package:customerapp/controller/ControlerSpecialty.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import 'AmbulancetTwo.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({Key? key}) : super(key: key);

  @override
  _AmbulanceScreenState createState() => _AmbulanceScreenState();
}

List Specialtychick = [];

class _AmbulanceScreenState extends State<AmbulanceScreen> {
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
          text: "Ambulance",
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
                text: "Medical Specialty",
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
                                  builder: (context) => AmbulancetTwo(
                                    idMedicalSpecialty: '${snapshot
                                        .data[index].id}', MedicalSpecialty: '${snapshot
                                      .data[index].name}',
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

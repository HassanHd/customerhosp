import 'package:customerapp/controller/FieldsController.dart';
import 'package:customerapp/controller/HealthCareContrroller.dart';
import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../constant.dart';
import 'HealthCareattach.dart';

class HelthCarethree extends StatefulWidget {
  String idMedicalSpecialty;
  String MedicalSpecialty;
  String longitude;
  String latitude;
  String country;
  String City;
  String Address;
  HelthCarethree({
    required this.idMedicalSpecialty,
    required this.MedicalSpecialty,
    required this.longitude,
    required this.latitude,
    required this.country,
    required this.City,
    required this.Address,
  });

  @override
  _HelthCarethreeState createState() => _HelthCarethreeState();

}

class _HelthCarethreeState extends State<HelthCarethree> {
  var radioItemMedicalInsurance;
  var radioItemPrices;
  var radioItemCompanies;
  var radioIsolation;
  var radioMedicaldetails;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _disController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Find Hospital",
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
      body: ChangeNotifierProvider<FieldsController>(
        create: (context) => FieldsController(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 0),
          child: ListView(
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: CustomText(
                      text: "Medical Insurance",
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                dense: false,
                subtitle: Row(
                  children: [
                    Expanded(
                      flex: 50,
                      child: RadioListTile(
                        groupValue: radioItemMedicalInsurance,
                        value: "Yse",
                        activeColor: primarydarkcolor,
                        title: Text("Yse"),
                        onChanged: (val) {
                          setState(() {
                            radioItemMedicalInsurance = val;
                            print("radioItem----$radioItemMedicalInsurance");
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: RadioListTile(
                        groupValue: radioItemMedicalInsurance,
                        value: "NO",
                        activeColor: primarydarkcolor,
                        title: Text("NO"),
                        onChanged: (val) {
                          setState(() {
                            radioItemMedicalInsurance = val;
                            print("radioItem----$radioItemMedicalInsurance");
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: CustomText(
                      text: "Sanitary Isolation",
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                dense: false,
                subtitle: Row(
                  children: [
                    Expanded(
                      flex: 50,
                      child: RadioListTile(
                        groupValue: radioIsolation,
                        value: "Yse",
                        activeColor: primarydarkcolor,
                        title: Text("Yse"),
                        onChanged: (val) {
                          setState(() {
                            radioIsolation = val;
                            print("radioItem----$radioIsolation");
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: RadioListTile(
                        groupValue: radioIsolation,
                        value: "NO",
                        activeColor: primarydarkcolor,
                        title: Text("NO"),
                        onChanged: (val) {
                          setState(() {
                            radioIsolation = val;
                            print("radioItem----$radioIsolation");
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomText(
                      text: "Companies",
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Container(child: Consumer<FieldsController>(
                    builder: (context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.companieslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                          groupValue: radioItemCompanies,
                          value: value.companieslist[index],
                          activeColor: primarydarkcolor,
                          dense: true,
                          title: Text(
                            value.companieslist[index],
                          ),
                          onChanged: (Object? value) {
                            setState(() {
                              radioItemCompanies = value;
                            });
                          });
                    },
                  );
                })),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomText(
                      text: "Prices",
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Container(child: Consumer<FieldsController>(
                    builder: (context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.priceslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                          groupValue: radioItemPrices,
                          value: value.priceslist[index].toString(),
                          activeColor: primarydarkcolor,
                          dense: true,
                          title: Text(
                            value.priceslist[index],
                          ),
                          onChanged: (Object? value) {
                            setState(() {
                              radioItemPrices = value;
                            });
                          });
                    },
                  );
                })),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: CustomText(
                      text: "Medical details",
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                dense: false,
                subtitle: Row(
                  children: [
                    Expanded(
                      flex: 50,
                      child: RadioListTile(
                        groupValue: radioMedicaldetails,
                        value: "Yse",
                        activeColor: primarydarkcolor,
                        title: Text("Yse"),
                        onChanged: (val) {
                          setState(() {
                            radioMedicaldetails = val;
                            print("radioItem----$radioMedicaldetails");
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: RadioListTile(
                        groupValue: radioMedicaldetails,
                        value: "NO",
                        activeColor: primarydarkcolor,
                        title: Text("NO"),
                        onChanged: (val) {
                          setState(() {
                            radioMedicaldetails = val;
                            print("radioItem----$radioMedicaldetails");
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: CustomText(
                      text: "Medical details (If you choose Yes)",
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                dense: false,
                subtitle: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _disController,

                        maxLines: 10,
                        //keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            // filled: true,
                            fillColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Medical details".tr().toString()),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter Medical details'
                                .tr()
                                .toString();
                          }
                          return null;
                        },
                      ),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              CustomButton(
                text: 'Next',
                onPressed: () {



                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HealthCareattach(SpecializationNmae:widget.MedicalSpecialty, SpecializationId: widget.idMedicalSpecialty, Address:widget.Address, city: widget.City, lat:widget.latitude, long:widget.longitude, country:widget.country, Isolation: radioIsolation, MedicalInsurance: radioItemMedicalInsurance, Medicalinsurancecompanies: radioItemCompanies, Medicaldetails: radioMedicaldetails, MedicalDetailsNote: _disController.text.toString(), Expectedprice: radioItemPrices)),
                  );
},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

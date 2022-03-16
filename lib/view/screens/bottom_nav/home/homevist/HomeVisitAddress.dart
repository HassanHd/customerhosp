import 'package:customerapp/controller/visitehomecontroller.dart';
import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:customerapp/view/widgets/webchat.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constant.dart';
import 'HomeVisitThree.dart';

class HomeVisitAddress extends StatefulWidget {
  String idMedicalSpecialty;
  String MedicalSpecialty;
  String longitude;
  String latitude;


  @override
  _HomeVisitAddressState createState() => _HomeVisitAddressState();

  HomeVisitAddress({
    required this.idMedicalSpecialty,
    required this.MedicalSpecialty,
    required this.longitude,
    required this.latitude,
  });
}

class _HomeVisitAddressState extends State<HomeVisitAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _CityController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomText(
                      text: "Name",
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
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
                            hintText:
                            "your Name".tr().toString()),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter Name'.tr().toString();
                          }
                          return null;
                        },
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomText(
                      text: "Phone",
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
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
                            hintText:
                            "your phone".tr().toString()),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter phone'.tr().toString();
                          }
                          return null;
                        },
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomText(
                      text: "Country",
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _countryController,
                        keyboardType: TextInputType.text,
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
                            hintText:
                            "your Country".tr().toString()),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter Country'.tr().toString();
                          }
                          return null;
                        },
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomText(
                      text: "City",
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _CityController,
                        keyboardType: TextInputType.text,
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
                            hintText:
                            "your City".tr().toString()),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter City'.tr().toString();
                          }
                          return null;
                        },
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomText(
                      text: "Address",
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _AddressController,
                        keyboardType: TextInputType.text,
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
                            hintText:
                            "your Address".tr().toString()),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter Address'.tr().toString();
                          }
                          return null;
                        },
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                CustomButton(
                  text: 'Send',
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      Provider.of<VisiteHomeContrroller>(context, listen: false).fetchVisiteHome( SpecializationNmae:widget.MedicalSpecialty, SpecializationId: widget.idMedicalSpecialty, Address:"${_AddressController.text.toString()}", city: "${_CityController.text.toString()}", lat:widget.latitude, long:widget.longitude, country:"${_countryController.text.toString()}",name:"${_nameController.text.toString()}",phone:"${_phoneController.text.toString()}").then((value){
                      if( Provider.of<VisiteHomeContrroller>(context, listen: false).Loading==false){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Done...'),
                        ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InAppchat()),
                        );

                      }
                      });


                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

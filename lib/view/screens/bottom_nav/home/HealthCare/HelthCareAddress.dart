import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import 'HelthCarethree.dart';

class HelthCareAddress extends StatefulWidget {
 String idMedicalSpecialty;
 String MedicalSpecialty;

 String longitude;
 String latitude;


  @override
  _HelthCareAddressState createState() => _HelthCareAddressState();

 HelthCareAddress({
    required this.idMedicalSpecialty,
    required this.MedicalSpecialty,
    required this.longitude,
    required this.latitude,
  });
}

class _HelthCareAddressState extends State<HelthCareAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _CityController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _regionController = TextEditingController();

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
                  text: 'Next',
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HelthCarethree(longitude: '${widget.longitude}', Address:'${_AddressController.text.toString()}', country: '${_countryController.text.toString()}', latitude: '${widget.latitude}', idMedicalSpecialty: '${widget.idMedicalSpecialty}',MedicalSpecialty: '${widget.MedicalSpecialty}', City: '${_CityController.text.toString()}',)),
                      );

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

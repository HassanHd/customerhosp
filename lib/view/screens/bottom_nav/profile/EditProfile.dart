import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:customerapp/controller/EditProfileController.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constant.dart';

class EditProfile extends StatefulWidget {
  String firstName;
  String lastName;
  String mobile;
  String email;
  String phone2;
  String address;
  String city;
  String country;



  @override
  _EditProfileState createState() => _EditProfileState();

  EditProfile({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.phone2,
    required this.address,
    required this.city,
    required this.country,
  });
}

class _EditProfileState extends State<EditProfile> {
  File? imageFile;
  var base64Image = "";
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();
  TextEditingController _PhonetwoController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();
  TextEditingController _CityController = TextEditingController();
  TextEditingController _CountryController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: textblue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: CustomText(
            text: "Edit Profile",
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
        body: Column(
          children: [
            Expanded(
              flex: 95,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      margin: const EdgeInsets.only(top: 60.0),
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: primarydarkcolor,
                          border:
                              Border.all(color: primarydarkcolor, width: 0.2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 25.0, right: 5, left: 5),
                        child: ListView(
                          children: [
                            //fristname
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "First Name".tr().toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _fnameController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                // filled: true,
                                fillColor: Colors.black87,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: white,
                                  ),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter First Name';
                                }
                                return null;
                              },
                            ),
                            //lname
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Last Name".tr().toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _lnameController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                // filled: true,
                                fillColor: Colors.black87,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter last Name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email".tr().toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _emailController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                // filled: true,
                                fillColor: Colors.black87,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter last Name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Phone".tr().toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _PhoneController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                // filled: true,
                                fillColor: Colors.black87,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter last Name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Another Phone".tr().toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _PhonetwoController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                // filled: true,
                                fillColor: Colors.black87,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter last Name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Country".tr().toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _CountryController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                // filled: true,
                                fillColor: Colors.black87,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Address';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "City".tr().toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _CityController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                // filled: true,
                                fillColor: Colors.black87,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter City';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Address".tr().toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.streetAddress,
                              controller: _AddressController,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                // filled: true,
                                fillColor: Colors.black87,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                ),
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Please Enter Address';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height / 7,
                      // width: MediaQuery.of(context).size.width,

                      child: GestureDetector(
                        onTap: () => _showSelectionDialog(context),
                        child: Center(
                          child: imageFile == null
                              ? Container(
                                  height: 100.0,
                                  width: 100.0,
                                  padding: EdgeInsets.all(5),
                                  decoration: new BoxDecoration(
                                    // color: Colors.yellow,

                                    color: primarydarkcolor,
                                    image: new DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage(
                                        "assets/icons/Camera.svg",
                                      ),
                                    ),
                                    border:
                                        Border.all(color: white, width: 5.0),
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(100.0)),
                                  ),
                                )
                              : new Container(
                                  height: 100.0,
                                  width: 100.0,
                                  decoration: new BoxDecoration(
                                    color: primarydarkcolor,
                                    image: new DecorationImage(
                                      image: new FileImage(imageFile!),
                                      fit: BoxFit.cover,
                                    ),
                                    border:
                                        Border.all(color: white, width: 5.0),
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(100.0)),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: RaisedButton(
                      color: primarydarkcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "EDIT",
                        style: TextStyle(color: white, fontSize: 16),
                      ),
                      onPressed: () {
                        print("im in fun onPressed------------>");
                        EditProfileController.getEditProfile(
                            firstName: _fnameController.text.toString(),
                            lastName: _lnameController.text.toString(),
                            mobile: _PhoneController.text.toString(),
                            email: _emailController.text.toString(),
                            phone2: _PhonetwoController.text.toString(),
                            address: _AddressController.text.toString(),
                            city: _CityController.text.toString(),
                            country: _CountryController.text.toString()).then((value){
                          EditProfileController.imageEditProfile(
                              image: base64Image).then((value){
                          Navigator.of(context).pop(true);
                        });
                        });


                      }),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print("imageFile----------------------------->$imageFile");
        List<int> imageBytes = imageFile!.readAsBytesSync();
        base64Image = base64Encode(imageBytes);
      });
    }
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _getFromGallery();
                        Navigator.pop(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _getFromCamera();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print("imageFile----------------------------->$imageFile");
        List<int> imageBytes = imageFile!.readAsBytesSync();
        base64Image = base64Encode(imageBytes);
      });
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:customerapp/controller/uploadattachmentcontroller.dart';
import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../constant.dart';

class AmbulanceFour extends StatefulWidget {
  const AmbulanceFour({Key? key}) : super(key: key);

  @override
  _AmbulanceFourState createState() => _AmbulanceFourState();
}

class _AmbulanceFourState extends State<AmbulanceFour> {
  File? imageFile;
  var base64Imageteam;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take Attachment?"),
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
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("File"),
                      onTap: () {
                        _getFromFile();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ));
        });
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
        base64Imageteam = base64Encode(imageBytes);
        print(base64Imageteam);
        // updatimge(base64Image, id);
      });
    }
  }

  /// Get from File
  _getFromFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      imageFile = File(result.files.single.path!);

      print("File----------------------------->$imageFile");

      List<int> fileBytes = imageFile!.readAsBytesSync();
      base64Imageteam = base64Encode(fileBytes);
      print(base64Imageteam);
      print(imageFile!.path);
    } else {
      // User canceled the picker
    }
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
        // print("imageFile----------------------------->$imageFile");
        // List<int> imageBytes = imageFile.readAsBytesSync();
        // print("dddd$imageBytes");
        // base64Image = base64UrlEncode(imageBytes);
        List<int> imageBytes = imageFile!.readAsBytesSync();
        base64Imageteam = base64Encode(imageBytes);
        print(base64Imageteam);

        // updatimge(base64Image, id);
      });
    }
  }

  String value = 'Select';
  TextEditingController _TitleController = TextEditingController();
  TextEditingController _disController = TextEditingController();

  // List of items in our dropdown menu
  var items = [
    'Select',
    'Analysis',
    'Rumors',
    'Prescriptions',
    'Reports',
  ];

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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: imageFile == null
                    ? TextButton.icon(
                  onPressed: () {
                    _showSelectionDialog(context);
                  },
                  icon: Icon(
                    Icons.attach_file_outlined,
                    color: gray,
                  ),
                  label: Text(
                    "Add attachment",
                    style: TextStyle(
                      color: gray,
                    ),
                  ),
                )
                    : TextButton.icon(
                  onPressed: () {
                    _showSelectionDialog(context);
                  },
                  icon: Icon(Icons.attach_file_outlined),
                  label: Text("Added Attachment successfully"),
                ),
              ),
              ListTile(
                dense: true,
                title: Text(
                  "Type",
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                      ),
                      color: white),
                  margin:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2),
                  child: DropdownButton(
                    // Initial Value
                    value: value,

                    // Down Arrow Icon
                    // icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 0,
                    autofocus: false,
                    iconSize: 0,
                    underline: SizedBox(),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        value = newValue!;
                      });
                    },
                  ),
                ),
              ),
              ListTile(
                dense: true,
                title: Text(
                  "Title",
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _TitleController,
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
                            hintText: "title".tr().toString()),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter Title'.tr().toString();
                          }
                          return null;
                        },
                      ),
                    )),
              ),
              ListTile(
                dense: true,
                title: Text(
                  "Description",
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
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
                            hintText: "Description".tr().toString()),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please Enter Description'.tr().toString();
                          }
                          return null;
                        },
                      ),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
                child: CustomButton(
                  text: 'Send',
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      Provider.of<UploadAttachmentControler>(context,
                          listen: false)
                          .fetchUploadAttachment(
                          field: value,
                          title: _TitleController.text.toString(),
                          description: _disController.text.toString(),
                          attached_file: base64Imageteam)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Added Attachment successfully'),
                        ));
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

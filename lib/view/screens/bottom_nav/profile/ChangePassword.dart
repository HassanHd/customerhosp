import 'package:customerapp/controller/ChangPassController.dart';
import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constant.dart';
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _NewController = TextEditingController();
  TextEditingController _OldController = TextEditingController();
  bool canObscure = true;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        title: CustomText(
          text: "Reset Password",
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                child: CustomText(
                  text:
                  "Please add your new password below and click on submit button ",
                  fontSize: 16,
                  color: black,
                  textAlign:TextAlign.center ,
                  fontWeight: FontWeight.bold,
                  // alignment: Alignment.center,
                ),
              ),

              SizedBox(
                height: height * .01,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CustomText(
                    text: "Old Password",
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
                      obscureText: canObscure,
                      controller: _OldController,
                      keyboardType: TextInputType.visiblePassword,


                      decoration: InputDecoration(
                        // filled: true,
                          fillColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                canObscure = !canObscure;
                              });
                            },
                          ),
                          hintText: "Please Enter Password"
                              .tr()
                              .toString()),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Password'
                              .tr()
                              .toString();
                        }
                        return null;
                      },
                    ),
                  )),
              SizedBox(
                height: height * .018,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CustomText(
                    text: "New Password",
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
                      obscureText: canObscure,
                      controller: _NewController,
                      keyboardType: TextInputType.visiblePassword,


                      decoration: InputDecoration(
                        // filled: true,
                          fillColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                canObscure = !canObscure;
                              });
                            },
                          ),
                          hintText: "Please Enter Password"
                              .tr()
                              .toString()),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Password'
                              .tr()
                              .toString();
                        }
                        return null;
                      },
                    ),
                  )),
              SizedBox(
                height: height * .018,
              ),

              CustomButton(
                text: " Change Password",
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    print("hi pass ${_NewController.text.toString()} == ${_OldController.text.toString()}");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please wait for the process to complete successfully'),

                    ));
                    Provider.of<ChangPassController>(context, listen: false).fetchChangPass( oldPassword: "${_OldController.text.toString()}", newPassword: '${_NewController.text.toString()} ').then((value){
                      Navigator.of(context).pop(true);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

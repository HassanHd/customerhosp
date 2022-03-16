import 'package:customerapp/controller/SignupController.dart';
import 'package:customerapp/view/widgets/BottomClipper.dart';
import 'package:customerapp/view/widgets/GWidgets.dart';
import 'package:customerapp/view/widgets/LoginBtn.dart';
import 'package:customerapp/view/widgets/OtherLogins.dart';
import 'package:customerapp/view/widgets/TopClipper.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bottom_nav/HomeTapScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _NameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool canObscure = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: width,
                height: height / 6,
                child: Image.asset(
                  "assets/icons/doctors.png",
                  fit: BoxFit.cover,
                )),
          ),
          Container(
              width: double.infinity,
              height: height / 1.2,
              // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xffE8F5FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: CustomText(
                        text: "SignUp",
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * .011,
                          ),
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
                                  controller: _NameController,
                                  keyboardType: TextInputType.name,
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
                                      hintText:
                                          " Please Enter Name".tr().toString()),
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please Enter Name'
                                          .tr()
                                          .toString();
                                    }
                                    return null;
                                  },
                                ),
                              )),
                          SizedBox(
                            height: height * .01,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomText(
                                text: "Email",
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
                                  controller: _EmailController,
                                  keyboardType: TextInputType.emailAddress,
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
                                      hintText: " Please Enter Email"
                                          .tr()
                                          .toString()),
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please Enter Email'
                                          .tr()
                                          .toString();
                                    }
                                    return null;
                                  },
                                ),
                              )),
                          SizedBox(
                            height: height * .01,
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
                                      hintText: " Please Enter Phone"
                                          .tr()
                                          .toString()),
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please Enter Phone'
                                          .tr()
                                          .toString();
                                    }
                                    return null;
                                  },
                                ),
                              )),
                          SizedBox(
                            height: height * .01,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomText(
                                text: "Password",
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
                                  controller: _passController,
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
                            height: height * .03,
                          ),
                          Center(
                            child: MaterialButton(
                              minWidth: width * .7,
                              height: height * .06,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
                                  Provider.of<SignupControler>(context, listen: false).fetchSignup(mobile: _phoneController.text.toString(), password: _passController.text.toString(), firstName: _NameController.text.toString(), email: _EmailController.text.toString(), lastName: _NameController.text.toString()).then((value){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text('Yay! A SnackBar!'),
                                    ));
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeTapScreen()),
                                            (Route<dynamic> route) => false);
                                  });

                                }
                              },
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                              color: Color(0xff2D87FF),
                            ),
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'I Have an account ',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 14.00),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' LOGIN',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 14.00),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(context);
                                        }),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

import 'package:customerapp/view/widgets/BottomClipper.dart';
import 'package:customerapp/view/widgets/GWidgets.dart';
import 'package:customerapp/view/widgets/LoginBtn.dart';
import 'package:customerapp/view/widgets/TopClipper.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
class Forgotpass extends StatefulWidget {
  const Forgotpass({Key? key}) : super(key: key);

  @override
  _ForgotpassState createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _EmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 85.0,
              left: 30.0,
              right: 30.0,
            ),
            child: Container(
                width: width,
                height: height / 5,
                child: Image.asset(
                  "assets/icons/doctors.png",
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xffE8F5FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Forget Password",
                              fontSize: 29,
                              fontWeight: FontWeight.bold
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * .03,
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
                              height: height * .019,
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

                                  }
                                },
                                child: Text(
                                  "Send",
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
                                  style: TextStyle(color: Colors.grey, fontSize: 14.00),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' LOGIN',
                                        style: TextStyle(color: Colors.blue,fontSize: 14.00),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pop(context);
                                          }),
                                  ],
                                ),
                              ),)

                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

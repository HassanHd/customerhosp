// import 'package:customerapp/view/screens/auth/signupscreen.dart';
// import 'package:customerapp/view/widgets/BottomClipper.dart';
// import 'package:customerapp/view/widgets/GWidgets.dart';
// import 'package:customerapp/view/widgets/LoginBtn.dart';
// import 'package:customerapp/view/widgets/OtherLogins.dart';
// import 'package:customerapp/view/widgets/TopClipper.dart';
// import 'package:customerapp/view/widgets/custom_text.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// import '../../../constant.dart';
// import '../bottom_nav/HomeTapScreen.dart';
// import 'forgotpass.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String? phone, password, name;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: textblue,
//       body: SingleChildScrollView(
//           child: Container(
//         width: double.infinity,
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               buildTopClippers(),
//               heightSpacer(20.00),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 45,
//                     height: 45,
//                     child: Image.asset(
//                       "assets/icons/Logo.png",
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   widthSpacer(10.00),
//                   CustomText(
//                     text: "Doctor App",
//                     fontSize: 25,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ],
//               ),
//               heightSpacer(25.00),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.00),
//                 child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                   onSaved: (value) {
//                     phone = value;
//                   },
//                   validator: (value) {
//                     if (!(value!.contains('@')) ||
//                         value == null ||
//                         value.isEmpty) {
//                       return 'Please Enter phone';
//                     }
//                     return null;
//                   },
//                   style: TextStyle(color: Colors.white),
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                       borderRadius: BorderRadius.circular(40.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                       borderRadius: BorderRadius.circular(40.0),
//                     ),
//                     prefixIcon: Icon(Icons.phone_android, color: Colors.white),
//                     hintText: "Phone",
//                     hintStyle: TextStyle(color: Colors.white),
//                     filled: true,
//                     fillColor: Color.fromRGBO(81, 165, 243, 1),
//                   ),
//                 ),
//               ),
//               heightSpacer(15.00),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.00),
//                 child: TextFormField(
//                   keyboardType: TextInputType.visiblePassword,
//                   style: TextStyle(color: Colors.white),
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                       borderRadius: BorderRadius.circular(40.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                       borderRadius: BorderRadius.circular(40.0),
//                     ),
//                     prefixIcon: Icon(Icons.lock, color: Colors.white),
//                     hintText: "Password",
//                     hintStyle: TextStyle(color: Colors.white),
//                     filled: true,
//                     fillColor: Color.fromRGBO(81, 165, 243, 1),
//                   ),
//                   validator: (String? value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter Password';
//                     }
//                     return null;
//                   },
//                   onSaved: (String? value) {
//                     password = value;
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 30,
//               ),
//               GestureDetector(
//                 onTap: (){
//                   Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => new Forgotpass()));
//
//                 },
//                 child: CustomText(
//                   text: "Forget Password?",
//                   color: Colors.blue,
//                   fontSize: 15,
//                 ),
//               ),
//               CustomText(
//                 text: "Or",
//                 color: Colors.grey,
//                 fontSize: 15,
//               ),
//               RichText(
//                 text: TextSpan(
//                   text: 'Don\'t have an account? ',
//                   style: TextStyle(color: Colors.grey, fontSize: 15.00),
//                   children: <TextSpan>[
//                     TextSpan(
//                         text: ' Signup',
//                         style: TextStyle(color: Colors.blue),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.of(context, rootNavigator: true).push(
//                                 MaterialPageRoute(
//                                     builder: (context) => new SignupScreen()));
//                           }),
//                   ],
//                 ),
//               ),
//               heightSpacer(25.00),
//               GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pushAndRemoveUntil(
//                         MaterialPageRoute(builder: (context) => HomeTapScreen()),
//                         (Route<dynamic> route) => false);
//                   },
//                   child: buildLoginContainer(context,"Login")),
//               heightSpacer(20.00),
//               buildOtherLogins(context),
//               buildBottomClippers()
//
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
import 'package:country_picker/country_picker.dart';
import 'package:customerapp/controller/LoginControler.dart';
import 'package:customerapp/view/screens/bottom_nav/HomeTapScreen.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'forgotpass.dart';
import 'signupscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool canObscure = true;
  String dialingCodemobile = "";
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
                height: height / 4,
                child: Image.asset(
                  "assets/icons/doctors.png",
                  fit: BoxFit.cover,
                )),
          ),
          Container(
              width: double.infinity,
              height: height / 1.4,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CustomText(
                            text: "LOGIN",
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
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
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.arrow_drop_down),
                                        onPressed: () {
                                          showCountryPicker(
                                            context: context,
                                            onSelect: (Country country) {
                                              setState(() {
                                                dialingCodemobile =
                                                    "+" + country.phoneCode;
                                                print(dialingCodemobile);
                                              });


                                            },
                                          );


                                        },
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
                            height: height * .018,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            new Forgotpass()));
                              },
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
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


                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                     content: Text('Please wait for the process to complete successfully'),

                                   ));
                                   Provider.of<LoginControler>(context, listen: false).fetchLogin(mobile: _phoneController.text.toString(), password: _passController.text.toString(), Codemobile: dialingCodemobile,context: context).then((value){

                                   });


                                }
                              },
                              child: Text(
                                "Login",
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
                                text: 'Don\'t have an account? ',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.00),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Signup',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      new SignupScreen()));
                                        }),
                                ],
                              ),
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: const [
                          //     Text(
                          //       "Don't have an account?",
                          //       style: TextStyle(
                          //           fontSize: 14, fontWeight: FontWeight.w400),
                          //     ),
                          //     Text(
                          //       "Sign Up",
                          //       style: TextStyle(
                          //           fontSize: 14.5, fontWeight: FontWeight.w800),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                color: Colors.black54,
                                endIndent: 5,
                                thickness: .5,
                              )),
                              Text(
                                "Or continue with",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w700),
                              ),
                              Expanded(
                                  child: Divider(
                                color: Colors.black54,
                                indent: 5,
                                thickness: .5,
                              )),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                elevation: 1,
                                child: Container(
                                    child: Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                )),
                                onPressed: () {},
                                color: Color(0xfff0f0ff),
                                minWidth: width * .12,
                                height: width * .12,
                              ),
                              SizedBox(
                                width: width * .04,
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                elevation: 1,
                                child: Container(
                                    child: Icon(
                                  Icons.email,
                                  color: Colors.red,
                                )),
                                onPressed: () {},
                                color: Color(0xfff0f0ff),
                                minWidth: width * .12,
                                height: width * .12,
                              ),
                            ],
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

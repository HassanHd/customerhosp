import 'package:customerapp/constant.dart';
import 'package:customerapp/view/screens/bottom_nav/home/HealthCare/HealthCareScreen.dart';
import 'package:customerapp/view/screens/bottom_nav/home/chats/ChatsScreen.dart';
import 'package:customerapp/view/screens/bottom_nav/home/homevist/homevisitsearchScreen.dart';
import 'package:customerapp/view/screens/bottom_nav/more/FAQScreen.dart';
import 'package:customerapp/view/screens/bottom_nav/more/SupportScreen.dart';
import 'package:customerapp/view/screens/bottom_nav/more/TermsScreen.dart';
import 'package:customerapp/view/screens/bottom_nav/profile/patienthistory/AnalysisScreen.dart';
import 'package:customerapp/view/widgets/nave.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/AmbulanceController.dart';
import 'controller/ChangPassController.dart';
import 'controller/ChatsController.dart';
import 'controller/FieldsController.dart';
import 'controller/HealthCareContrroller.dart';
import 'controller/LoginControler.dart';
import 'controller/SignupController.dart';
import 'controller/uploadattachmentcontroller.dart';
import 'controller/visitehomecontroller.dart';
import 'view/screens/auth/checkscreen.dart';
import 'view/screens/auth/loginscreen.dart';
import 'view/screens/bottom_nav/HomeTapScreen.dart';
import 'view/screens/bottom_nav/home/Doctors/DoctorSearchScreen.dart';
import 'view/screens/bottom_nav/home/ambulance/AmbulanceScreen.dart';
import 'view/screens/bottom_nav/profile/BookingScreen.dart';
import 'view/screens/bottom_nav/profile/ChangePassword.dart';
import 'view/screens/bottom_nav/profile/FavouritesScreen.dart';
import 'view/screens/bottom_nav/profile/mypatienthistory.dart';
import 'view/screens/bottom_nav/profile/patienthistory/PrescriptionsSearchScreen.dart';
import 'view/screens/bottom_nav/profile/patienthistory/RadiologyScreen.dart';
import 'view/screens/bottom_nav/profile/patienthistory/ReportsScreen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignupControler()),
          ChangeNotifierProvider(create: (_) => UploadAttachmentControler()),
          ChangeNotifierProvider(create: (_) => LoginControler()),
          ChangeNotifierProvider(create: (_) => FieldsController()),
          ChangeNotifierProvider(create: (_) => ChangPassController()),
          ChangeNotifierProvider(create: (_) => HealthCareContrroller()),
          ChangeNotifierProvider(create: (_) => VisiteHomeContrroller()),
          ChangeNotifierProvider(create: (_) => AmbulanceContrroller()),
          ChangeNotifierProvider(create: (_) => ChatsController()),

        ],
        child: EasyLocalization(
          child: MyApp(),
          path: "resources/langs",
          supportedLocales:  [
            Locale('en', 'EN'),
            Locale('ar', 'AR'),
          ],
          saveLocale: true,
        ),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'el-mostashfa',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),


        primarySwatch: Colors.blue,
          backgroundColor: Colors.white

      ),
      navigatorKey: NavigationService.instance.navigationKey,
      routes: {
        "SupportScreen": (BuildContext context) => SupportScreen(),
        "terms": (BuildContext context) => TermsScreen(),
        "ChangePasswordScreen": (BuildContext context) => ChangePasswordScreen(),
        "mypatienthistory": (BuildContext context) => mypatienthistory(),
        "LoginScreen": (BuildContext context) => LoginScreen(),
        "FAQScreen": (BuildContext context) => FAQScreen(),
        "ChatsScreen": (BuildContext context) => ChatsScreen(),
        "HomeVisitSearchScreen": (BuildContext context) => HomeVisitSearchScreen(),
        "HealthCareScreen": (BuildContext context) => HealthCareScreen(),
        "DoctorSearchScreen": (BuildContext context) => DoctorSearchScreen(),
        "RadiologyScreen": (BuildContext context) => RadiologyScreen(),
        "AnalysisScreen": (BuildContext context) => AnalysisScreen(),
        "AmbulanceScreen": (BuildContext context) => AmbulanceScreen(),
        "Reports": (BuildContext context) => ReportsScreen(),
        "FavouritesScreen": (BuildContext context) => FavouritesScreen(),
        "BookingScreen": (BuildContext context) => BookingScreen(),
        "PrescriptionsSearchScreen": (BuildContext context) => PrescriptionsSearchScreen(),

      },
      home:  AnimatedSplashScreen(
        backgroundColor: primarycolor,
        duration: 3000,
        splash:
        Image.asset(
          "assets/icons/img.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        splashIconSize: double.infinity,
        nextScreen:CheckScreen(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,

      ),
    );
  }
  // checkid() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if(pref.getString("id")!=null){
  //     print(pref.getString("id").toString());
  //     return LoginScreen();
  //   }else{
  //     print(pref.getString("id").toString());
  //     return HomeTapScreen();
  //   }
  //
  // }
}


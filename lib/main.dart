import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:minibiz/main/BusinessProfile.dart';
import 'package:minibiz/main/bottomNavBar.dart';
import 'package:minibiz/main/ChangeBusinessDetails.dart';
import 'package:minibiz/main/feed.dart';
import 'package:minibiz/startup/businessDetails.dart';
import 'package:minibiz/startup/login.dart';
import 'package:minibiz/startup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  //runApp(SplashPage());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: login(),
        home: AnimatedSplashScreen(
          splash: Image.asset('assets/SplashFast.gif'),
          nextScreen: login(),
          splashIconSize: 500,
          splashTransition: SplashTransition.fadeTransition,
           backgroundColor: Colors.white,
          //duration: 1500,
        ),
        // home: SplashPage(),
      ),
    );
  }
}

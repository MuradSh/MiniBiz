import 'package:flutter/material.dart';
import 'package:minibiz/startup/businessSignUp.dart';
import 'package:minibiz/widgets/TextFieldEnhanced.dart';
import 'package:minibiz/startup/businessSignUp.dart';
import 'package:minibiz/startup/login.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minibiz/widgets/PageHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:minibiz/main/feed.dart';
import 'package:minibiz/main/bottomNavBar.dart';

class businessLogin extends StatefulWidget {
  const businessLogin({Key? key}) : super(key: key);

  @override
  _businessLoginState createState() => _businessLoginState();
}

class _businessLoginState extends State<businessLogin> {
  double _mediaHeight = 0;
  double _mediaWidth = 0;

  FirebaseAuth _auth = FirebaseAuth.instance;
  final _nameFieldController = TextEditingController();
  final _passFieldController = TextEditingController();

  _login() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(_nameFieldController.text.length==0 || _passFieldController.text.length==0){
      PageHelper.showOkAlertDialog(context: context,alertDialogTitle: "Error",alertDialogMessage: 'Please enter values');
      return;
    }
    String emailFinal = _nameFieldController.text.trim()+"@minibizwebsite.com";
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(
                  color: Colors.purple,
                ),
                SizedBox(width: 20),
                Text("Loading",style: TextStyle(fontSize: 25),),
              ],
            ),
          ),
        );
      },
    );

    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailFinal,
          password: _passFieldController.text.trim()
      );
      var userId = _auth.currentUser!.uid;
      Navigator.pop(context);
      print("OKKKK");
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) =>
          new bottomNavBar()
      ));
      prefs.setString("name", _nameFieldController.text);
      prefs.setString("type", "business");
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.pop(context);
      if (e.code == 'user-not-found' ) {
        PageHelper.showOkAlertDialog(context: context,alertDialogTitle: "Error",alertDialogMessage: 'User not found');
      }else if (e.code == 'wrong-password') {
        PageHelper.showOkAlertDialog(context: context,alertDialogTitle: "Error",alertDialogMessage: 'Wrong password');
      }else{
        PageHelper.showOkAlertDialog(context: context,alertDialogTitle: "Error",alertDialogMessage: 'Error. Please try again.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child:SafeArea(
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/MinibizEdited.png"),
                  height: _mediaHeight*0.23,
                  width: _mediaHeight*0.23,
                ),

                Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                      fontFamily: 'Quicksand'
                  ),
                ),
                SizedBox(height:  _mediaHeight*0.004),
                Text(
                  "Login To Continue",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Quicksand'
                  ),
                ),
                SizedBox(height:  _mediaHeight*0.03),
                ClipPath(
                  clipper: WaveClipperTwo(reverse: true),
                  child: Container(
                    height: _mediaHeight-_mediaHeight*0.41,
                    width: _mediaWidth,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        SizedBox(height:  _mediaHeight*0.07),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFieldEnhanced("Business Name",Icons.storefront,controller: _nameFieldController,),
                        ),
                        SizedBox(height:  _mediaHeight*0.05),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFieldEnhanced("Password",Icons.lock,passField: true,controller: _passFieldController,),
                        ),
                        SizedBox(height:  _mediaHeight*0.05),
                        SizedBox(
                          width: _mediaWidth*0.8,
                          height: _mediaHeight*0.07,
                          child: ElevatedButton(
                            onPressed: () {
                              _login();
                            },
                            child: Text("Sign In",style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.w500),),
                            style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 28
                                ),
                                primary: Colors.lightBlue,
                                elevation: 3
                            ),
                          ),
                        ),
                        Expanded(
                            child: new Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, new MaterialPageRoute(
                                            builder: (context) =>
                                            new businessSignUp())
                                        );
                                      },
                                      child: Text(
                                        "Don't have an account yet? Sign Up",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                    )
                                  ],
                                )
                            )
                        ),
                        SizedBox(height:  _mediaHeight*0.02),
                        SizedBox(
                          width: _mediaWidth*0.5,
                          height: _mediaHeight*0.04,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) =>
                                  new login())
                              );
                            },
                            child: Text("Personal Account",style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.w500),),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28.0),
                                        side: BorderSide(color: Colors.blue)
                                    )
                                )

                            ),
                          ),
                        ),
                        SizedBox(height:  _mediaHeight*0.02),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

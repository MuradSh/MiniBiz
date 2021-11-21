import 'package:flutter/material.dart';
import 'package:minibiz/widgets/TextFieldEnhanced.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:minibiz/startup/businessLogin.dart';
import 'package:minibiz/startup/businessDetails.dart';

class businessSignUp extends StatefulWidget {
  const businessSignUp({Key? key}) : super(key: key);

  @override
  _businessSignUpState createState() => _businessSignUpState();
}

class _businessSignUpState extends State<businessSignUp> {
  double _mediaHeight = 0;
  double _mediaWidth = 0;

  // FirebaseAuth _auth = FirebaseAuth.instance;
  final _phoneFieldController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:SafeArea(
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/MinibizEdited.png"),
                  height: _mediaHeight*0.23,
                  width: _mediaHeight*0.23,
                ),

                Text(
                  "Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                      fontFamily: 'Quicksand'
                  ),
                ),
                SizedBox(height:  _mediaHeight*0.004),
                Text(
                  "Sign Up To Continue",
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
                    child:Container(
                      child: Column(
                        children: [
                          SizedBox(height:  _mediaHeight*0.07),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFieldEnhanced("Phone",Icons.phone,controller: _phoneFieldController,),
                          ),
                          SizedBox(height:  _mediaHeight*0.05),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFieldEnhanced("Business Name",Icons.storefront,controller: _usernameController),
                          ),
                          SizedBox(height:  _mediaHeight*0.05),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFieldEnhanced("Password",Icons.lock,passField: true,controller: _passFieldController,),
                          ),
                          SizedBox(height:  _mediaHeight*0.03),
                          SizedBox(
                            width: _mediaWidth*0.8,
                            height: _mediaHeight*0.07,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, new MaterialPageRoute(
                                    builder: (context) =>
                                    new BusinessDetails(
                                      _usernameController,
                                      _passFieldController,
                                      _phoneFieldController
                                    )
                                )
                                );
                              },
                              child: Text("Sign Up",style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.w500),),
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
                                              new businessLogin())
                                          );
                                        },
                                        child: Text(
                                          "Already have an account? Log in",
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  )
                              )
                          ),
                          SizedBox(height:  _mediaHeight*0.02),
                        ],
                      ),
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

import 'package:flutter/material.dart';
import 'package:minibiz/widgets/TextFieldEnhanced.dart';
import 'package:minibiz/startup/signup.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  double _mediaHeight = 0;
  double _mediaWidth = 0;

  // FirebaseAuth _auth = FirebaseAuth.instance;
  final _phoneFieldController = TextEditingController();
  final _passFieldController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child:SafeArea(
            child: Column(
              children: [   Image(
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
                            child: TextFieldEnhanced("Username",Icons.person),
                          ),
                          SizedBox(height:  _mediaHeight*0.05),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFieldEnhanced("Password",Icons.lock,passField: true,),
                          ),
                          SizedBox(height:  _mediaHeight*0.05),
                          SizedBox(
                            width: _mediaWidth*0.8,
                            height: _mediaHeight*0.07,
                            child: ElevatedButton(
                              onPressed: () {
                                print("a");
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
                                              new signup())
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

import 'package:flutter/material.dart';
import 'package:minibiz/widgets/TextFieldEnhanced.dart';
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
        body: Container(
          child:SafeArea(
            child: Column(
              children: [   Image(
                image: AssetImage("assets/Minibiz.png"),
                height: _mediaHeight*0.25,
                width: _mediaHeight*0.25,
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
                ClipPath(
                  clipper: WaveClipperTwo(reverse: true),
                  child: Container(
                    height: 220,
                    color: Colors.red,
                    child: Center(
                        child:
                        Text("OctagonalClipper()"),
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

import 'package:flutter/material.dart';
import 'package:minibiz/widgets/TextFieldEnhanced.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

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
        body: SingleChildScrollView(
          child:SafeArea(
            child: Column(
              children: [   Image(
                image: AssetImage("assets/MinibizEdited.png"),
                height: _mediaHeight*0.25,
                width: _mediaHeight*0.25,
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
                  "Register To Continue",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Quicksand'
                  ),
                ),
                // ClipPath(
                //   clipper: WaveClipperTwo(reverse: true),
                //   child: Container(
                //     height: 220,
                //     color: Colors.red,
                //     child:
                //         Container(
                //           child:
                //                   Row(
                //                     children: [
                //                       // TextFieldEnhanced("placeholder", IconData(0x41, fontFamily: 'Roboto'),),
                //                       // TextFieldEnhanced("placeholder", IconData(0x41, fontFamily: 'Roboto'))
                //                     ],
                //                   ),
                //         ),
                //             ),
                //   ),
                SizedBox(height: _mediaHeight*0.03,),

                TextFieldEnhanced("Name", IconData(0x41, fontFamily: 'Roboto'),paddingText: EdgeInsets.all(5),),

                TextFieldEnhanced("Email", IconData(0x41, fontFamily: 'Roboto'),paddingText: EdgeInsets.all(5),),
                TextFieldEnhanced("password", IconData(0x41, fontFamily: 'Roboto'),),
                TextFieldEnhanced("confirm password", IconData(0x41, fontFamily: 'Roboto'),paddingText: EdgeInsets.all(5),),
                TextFieldEnhanced("City", IconData(0x41, fontFamily: 'Roboto'),paddingText: EdgeInsets.all(5),),


                SizedBox(height: _mediaHeight*0.05,),

                TextButton(
                    onPressed: (){},
                    child: Container(
                      width: _mediaWidth*0.9,
                      height: _mediaHeight*0.059,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(70, 197, 206, 1)

                      ),

                      child: Center(
                        child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Quicksand'),
                        textAlign: TextAlign.center,
                      ),
                      )
                ))


              ],
            ),
          ),
        )
    );
  }
}

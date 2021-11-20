import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef void MyCallback(String addy);
class TextFieldEnhanced extends StatelessWidget {

  String placeholder="";
  IconData icon;
  bool passField;
  double fontSize;
  EdgeInsets paddingText;
  FocusNode? focusNode;
  TextEditingController? controller = null;
  MyCallback? onChange;

  TextFieldEnhanced(this.placeholder,this.icon, {
    this.passField = false,
    this.fontSize = -1,
    this.paddingText = const EdgeInsets.fromLTRB(10, 10, 20, 10),
    this.focusNode,
    this.controller,
    this.onChange
  });

  double _mediaHeight = 0;
  double _mediaWidth = 0;

  @override
  Widget build(BuildContext context) {

    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;

    return TextField(
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(fontSize: (fontSize==-1 ? _mediaHeight*0.04 : fontSize), color: Color(0xffa1a1a1)),
        contentPadding: this.paddingText,
        prefixIcon: Icon(this.icon,size: (fontSize==-1 ? _mediaHeight*0.04 : fontSize*1.01),color: Color(0xffa1a1a1)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 1.5,
                color: Color(0xffb2b2b2)
            )
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2.5,
                color: Color(0xff818181)
            )
        ),
      ),
      style: TextStyle(
          fontSize: (fontSize==-1 ? _mediaHeight*0.03 : fontSize),
          color: Color(0xff111111),
          fontFamily: 'Quicksand'
      ),
      enableSuggestions: false,
      autocorrect: false,
      obscureText: passField,
      focusNode: focusNode,
      controller: controller,
      onChanged: onChange,
    );
  }
}
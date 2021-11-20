import 'package:flutter/material.dart';
import 'package:minibiz/widgets/TextFieldEnhanced.dart';

class ChangeBusinessDetails extends StatefulWidget {
  const ChangeBusinessDetails({Key? key}) : super(key: key);

  @override
  _ChangeBusinessDetailsState createState() => _ChangeBusinessDetailsState();
}

class _ChangeBusinessDetailsState extends State<ChangeBusinessDetails> {
  double _mediaHeight = 0;
  double _mediaWidth = 0;
  @override
  Widget build(BuildContext context) {
    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
          child:SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
              child: Column(
                children: [
                  Text("Update Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      fontFamily: 'Quicksand'
                  ),
                  ),
                  SizedBox(height: _mediaHeight*0.04,),
                  Column(
                    children: [
                    Text("Business Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontFamily: 'Quicksand'
                    ),
                  ),
                      TextFieldEnhanced("Enter New Name", Icons.store_mall_directory_rounded,fontSize: 20,),

                      SizedBox(height: _mediaHeight*0.03,),

                      Text("Update Bio",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: 'Quicksand'
                        ),
                      ),
                      SizedBox(height: _mediaHeight*0.01,),
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      SizedBox(height: _mediaHeight*0.03,),

                      Text("Phone Number",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: 'Quicksand'
                        ),
                      ),
                      TextFieldEnhanced("Enter Email", Icons.store_mall_directory_rounded,fontSize: 20,),
                      SizedBox(height: _mediaHeight*0.03,),
                      Text("Email",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: 'Quicksand'
                        ),
                      ),
                      TextFieldEnhanced("Enter Email", Icons.store_mall_directory_rounded,fontSize: 20,),


                      SizedBox(height: _mediaHeight*0.04,),

                      SizedBox(
                        width: _mediaWidth*0.8,
                        height: _mediaHeight*0.07,
                        child: ElevatedButton(
                          onPressed: () {
                            print("data updated");
                          },
                          child: Text("Update Data",style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.w500),),
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                  fontSize: 25
                              ),
                              primary: Colors.lightBlue,
                              elevation: 3
                          ),
                        ),
                      ),

                    ],
                  )
                ]

          ),
            ),
        ),

    )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:minibiz/widgets/TextFieldEnhanced.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({Key? key}) : super(key: key);

  @override
  _BusinessDetailsState createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {

  double _mediaHeight = 0;
  double _mediaWidth = 0;
  String? _selectedValue;
  String? _selectedLocation;



  // FirebaseAuth _auth = FirebaseAuth.instance;
  final _bioFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
          child:SafeArea(
            child: Column(
              children: [
                SizedBox(height: 15,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){

                    }, icon: Icon(Icons.chevron_left_rounded,color: Colors.black,size: 40,)),

                    SizedBox(height: 10,),

                    Text(
                      "Just few more steps",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'Quicksand'
                      ),
                    ),

            ]

                ),
                 SizedBox(height: 15,),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   child:
                   Column(
                   children: [
                     Text(
                      "Tell us what best describes your business?",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          fontFamily: 'Quicksand'
                      ),
                    ),

                     SizedBox(height:  _mediaHeight*0.025),


                     TextField(
                       keyboardType: TextInputType.multiline,
                       decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           hintText: 'Describe your business'
                       ),
                       maxLines: 7,
                     ),
                     //SizedBox(height:  _mediaHeight*0.3),

                     SizedBox(height:  _mediaHeight*0.025),

                     Text(
                       "What type of business do you conduct?",
                       overflow: TextOverflow.ellipsis,
                       maxLines: 4,
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.normal,
                           fontSize: 20,
                           fontFamily: 'Quicksand'
                       ),
                     ),
                     //TODO: Add a text box to enter description

                     SizedBox(height:  _mediaHeight*0.004),

                     DropdownButton<String>(
                       hint: _selectedValue == null ? Text("Business Type",style: TextStyle(color: Colors.grey)) : Text(_selectedValue!, style: TextStyle(color: Colors.black),),
                       onChanged: (newValue) {
                         setState(() {
                           _selectedValue = newValue;
                         });
                       },
                       items: <String>['Food', 'Services', 'Art', 'Culture', 'Entertainment', 'Antiques'].map((String value) {
                         return DropdownMenuItem<String>(

                           value: value,
                           child: Text(value),
                         );
                       }).toList(),
                     ),

                     SizedBox(height: _mediaHeight*0.02,),

                       Text(
                         "In which city are you located?",
                         textAlign: TextAlign.start,
                         overflow: TextOverflow.ellipsis,
                         maxLines: 2,
                         style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.normal,
                             fontSize: 20,
                             fontFamily: 'Quicksand'
                         ),
                       ),




                   ]
                   ),
                 ),

                SizedBox(height: _mediaHeight*0.03,),

                DropdownButton<String>(
                  hint: _selectedLocation == null ? Text("City",style: TextStyle(color: Colors.grey)) : Text(_selectedLocation!, style: TextStyle(color: Colors.black),),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue;
                    });
                  },
                  items: <String>['City A', 'City B', 'City C', 'City D', 'City E', 'City F'].map((String value) {
                    return DropdownMenuItem<String>(

                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),


                SizedBox(height: _mediaHeight*0.03,),

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
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
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

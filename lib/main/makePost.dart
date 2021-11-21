import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minibiz/widgets/PageHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomNavBar.dart';
class makePost extends StatefulWidget {
  const makePost({Key? key}) : super(key: key);

  @override
  _makePostState createState() => _makePostState();
}

class _makePostState extends State<makePost> {
  double _mediaHeight = 0;
  double _mediaWidth = 0;
  final _bioFieldController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> postTypes = ['Food', 'Services', 'Art', 'Culture', 'Entertainment', 'Antiques'];
  List<dynamic> chosenPostType = [];
  String? _selectedValue;




  _uploadPost() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //String emailFinal = widget.username.text.trim()+"@minibizwebsite.com";
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
                Text("Uploading..",style: TextStyle(fontSize: 25),),
              ],
            ),
          ),
        );
      },
    );

    try {
      // UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      //     email: emailFinal,
      //     password: widget.pass.text
      // );

      var userId = _auth.currentUser!.uid;
      print(userId);
      Navigator.pop(context);
      CollectionReference usersFB = FirebaseFirestore.instance.collection('posts');
      usersFB.doc(userId)
          .set({
        "businessId": null,
        "likes": 0,
        "postImage": "default pic",
        "postType": chosenPostType,
        "postText": _bioFieldController.text.trim(),
      })
          .onError((error, stackTrace) => print(error))
          .then((value) {
        Navigator.push(context, new MaterialPageRoute(
            builder: (context) =>
            new bottomNavBar()
        ));
        print("doneee");
        //prefs.setString("name", widget.username.text);
        //prefs.setString("type", "business");
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      new Future.delayed(new Duration(seconds: 0), () {
        Navigator.pop(context); //pop dialog
      }).then((value){
        PageHelper.showOkAlertDialog(context:context,alertDialogTitle:"Error",alertDialogMessage:"Please try again");
        print(e);
      });
    } catch (e) {
      Navigator.pop(context);
      new Future.delayed(new Duration(seconds: 1), () {
        Navigator.pop(context); //pop dialog
      }).then((value){
        PageHelper.showOkAlertDialog(context:context,alertDialogTitle:"Error",alertDialogMessage:e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
          ),
        ),
        title: Text('Post',style: TextStyle(fontFamily: 'Quicksand',fontSize: 25,letterSpacing: 1.2),),
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [

              SizedBox(height: _mediaHeight*0.02,),
              Text(
               "What are you selling today?",
               style: TextStyle(
                   fontWeight: FontWeight.w500,
                   fontSize: 22,
                   fontFamily: 'Quicksand'
               ),
             ),
              SizedBox(height: _mediaHeight*0.02,),
              TextField(
                controller: _bioFieldController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: _mediaHeight*0.03,),

              Text("What kind of post is it?",style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 17
              )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: _mediaWidth * 0.03,
                    horizontal: _mediaHeight * 0.01),
                child: Container(
                  height: 50,
                  width: _mediaWidth*0.9,
                  padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey),
                        top: BorderSide(width: 1, color: Colors.grey),
                        right: BorderSide(width: 1, color: Colors.grey),
                        left: BorderSide(width: 1, color: Colors.grey),
                      ),
                      color: Colors.transparent
                  ),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                            children: [
                              if(chosenPostType.length==0)...{
                                Text("Type of Post",style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Quicksand',
                                    color: Colors.grey
                                )),
                              },
                              ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: chosenPostType.length,
                                  itemBuilder:(context,index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            print(index);
                                            chosenPostType.remove(postTypes[postTypes.indexOf(chosenPostType[index])]);
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              border: Border(
                                                bottom: BorderSide(width: 1, color: Colors.grey),
                                                top: BorderSide(width: 1, color: Colors.grey),
                                                right: BorderSide(width: 1, color: Colors.grey),
                                                left: BorderSide(width: 1, color: Colors.grey),
                                              ),
                                              color: Colors.lightBlue[600]
                                          ),
                                          child: Text(
                                            "${chosenPostType[index]}  x",
                                            style: TextStyle(
                                                color: Colors.lightBlue[100],
                                                fontSize: 17
                                            ),
                                          ),
                                          padding: EdgeInsets.all(8),
                                        ),
                                      ),
                                    );
                                  }
                              )
                            ] // children of row
                        ),
                      )
                  ),
                ),
              ),

              DropdownButton<String>(
                hint: _selectedValue == null ? Text("Post Type",style: TextStyle(color: Colors.grey)) : Text(_selectedValue!, style: TextStyle(color: Colors.black),),
                onChanged: (newValue) {
                  setState(() {
                    chosenPostType.add(newValue);
                  });
                },
                items: postTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),


              SizedBox(height: _mediaHeight*0.04,),

              Text(
                "Show us your product?",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    fontFamily: 'Quicksand'
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/Minibiz.png",color: Colors.grey, width: _mediaWidth*0.5, height: _mediaWidth*0.5,),
              ),
          SizedBox(
            width: _mediaWidth*0.5,
            height: _mediaHeight*0.04,
            child: ElevatedButton(
              onPressed: () {
              },
              child: Text("Browse Image",style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.w500),),
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
              SizedBox(height: _mediaHeight*0.05,),

              SizedBox(
                width: _mediaWidth*0.5,
                height: _mediaHeight*0.06,
                child: ElevatedButton(
                  onPressed: () {

                    _uploadPost();
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) =>
                        new bottomNavBar())
                    );

                  },
                  child: Text("Post",style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.w500),),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(color: Colors.blue)
                          ),
                      ),
                  ),
                ),
              ),

              SizedBox(height: _mediaHeight*0.02,),

            ],
          ),
        ),
      ),
    );
  }
}

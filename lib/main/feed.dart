import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minibiz/widgets/PostWidget.dart';
import 'package:minibiz/main/makePost.dart';
import 'package:shared_preferences/shared_preferences.dart';

class feed extends StatefulWidget {
  const feed({Key? key}) : super(key: key);

  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feed> {
  var posts = [];//stores all posts from firestore
  var customerTypePref = ['Antiques'];//will hold the biz preference of customer for now I made dummy list

  initState(){
    getInfo();
    getPosts();
  }
  // profile type, 0 - user , 1 -biz
  int type = 0;

  getInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("type")=="business"){
      setState(() {
        type=1;
      });
    }
    // I saved bizPref List in personalDetails as json in shared prefereces
    //was trying to conv json data to list back again Error was coming didnt understood
    //customerTypePref = json.decode(prefs.getString("bizPref"));
  }

  getPosts() async{

    FirebaseFirestore.instance.collection("posts").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result["postText"]);
        if(result["postType"].length!=0){print(result["postType"][0]);}
        //if(result["postType"])
        if (customerTypePref.any((item) => result["postType"].contains(item))) {
          // Lists have at least one common element
          posts.add(result);

        }
        print(result.data());
        print(posts);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text('Newsfeed',style: TextStyle(fontFamily: 'Quicksand',fontSize: 25,letterSpacing: 1.2),),
        centerTitle: true,
        elevation: 3,
        actions: [
          if(type==1)...{
            GestureDetector(
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new makePost()
                ));
              },
                child: Icon(Icons.add, size: 30),
            ),
            SizedBox(width: 10)
          }
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i=0; i<posts.length; i++)
              PostWidget(0, "name", posts[i]["postImage"], posts[i]["postText"]),//data is getting stored in posts array but ui not updating


          ],
        ),
      ),

    );
  }
}

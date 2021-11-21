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


  initState(){
    getInfo();
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
            PostWidget()
          ],
        ),
      ),

    );
  }
}

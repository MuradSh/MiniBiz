import 'package:flutter/material.dart';
class makePost extends StatefulWidget {
  const makePost({Key? key}) : super(key: key);

  @override
  _makePostState createState() => _makePostState();
}

class _makePostState extends State<makePost> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Text("a")
        ],
      ),
    );
  }
}

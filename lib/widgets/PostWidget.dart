import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  PostWidget({Key? key}) : super(key: key);

  double _mediaHeight = 0;
  double _mediaWidth = 0;

  @override
  Widget build(BuildContext context) {

    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;

    return Container(
      width: _mediaWidth,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      child: Column(
        children: [
          SizedBox(width: 15,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/MinibizEdited.png"),
                ),
                SizedBox(width: 15,),
                Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 23
                    ),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(5),
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor nunc leo, id venenatis urna dictum id. Vivamus quis dui sem. Phasellus vestibulum eros in euismod venenatis. Nulla id efficitur urna, sit amet maximus ante. Vivamus at pellentesque diam. Proin tristique venenatis justo in euismod. Nam faucibus feugiat dui, vel vehicula nunc congue a.",style: TextStyle(fontSize: 18,letterSpacing: 1.1),)
          ),
          Image.asset("assets/Minibiz.png"),
          Row(
            children: [
              SizedBox(width: 15),
              Text("0",style: TextStyle(fontFamily: 'Quicksand',fontSize: 30,color: Colors.grey),),
              SizedBox(width: 5),
              Icon(
                Icons.thumb_up_alt_outlined,
                size: 30,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
class makePost extends StatefulWidget {
  const makePost({Key? key}) : super(key: key);

  @override
  _makePostState createState() => _makePostState();
}

class _makePostState extends State<makePost> {
  double _mediaHeight = 0;
  double _mediaWidth = 0;
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
      body: Padding(
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
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
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










          ],
        ),
      ),
    );
  }
}

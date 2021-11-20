import 'package:flutter/material.dart';
import 'package:minibiz/main/ChangeBusinessDetails.dart';
import 'package:minibiz/startup/login.dart';

class BusinessProfile extends StatefulWidget {
  const BusinessProfile({Key? key}) : super(key: key);

  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  double _mediaHeight = 0;
  double _mediaWidth = 0;
  var _listData = ['Change Business details', 'past orders', 'Manage  Customer Reviews', 'Chat with customers','Logout'];
  var _iconList = [Icon(Icons.info_outline),Icon(Icons.receipt_long_rounded),Icon(Icons.star),Icon(Icons.chat),Icon(Icons.logout)];

  @override
  Widget build(BuildContext context) {

    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.chevron_left_rounded,size: 35,)),
                    CircleAvatar(
                      backgroundImage:  AssetImage("assets/MinibizEdited.png"),
                      backgroundColor: Colors.grey,
                      radius: 45,
                    ),
                    SizedBox(width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Business Name",
                            style:  TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                fontFamily: 'Quicksand'),
                        ),
                        SizedBox(height: 5,),
                        Text("\$500"),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Divider(
                  color: Colors.black45,
                  thickness: 2,
                ),
                  SizedBox(height: 10,),

                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                      itemCount: _listData.length,
                        itemBuilder: (_,index){
                        return ListTile(

                          title: Text(_listData[index],
                            style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              fontFamily: 'Quicksand')
                          ),
                          leading: _iconList[index],
                          onTap: (){
                            _navigateAndDisplaySelection(context, index);
                          },

                        );
                        }, separatorBuilder: (BuildContext context, int index) {

                        return Divider(thickness: 0.8,
                          indent: 20,
                          endIndent: 20,
                        );
                    },),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context, int index){
// here you check the index and then route the navigation

    if(index == 0){
//navigate change business details
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    }

    else if(index==1){
//navigate past orders
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    }
    else if(index==2){
//navigate manage customer reviews
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    }
    else if(index==3){
      //chat with customers
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    }
    else if(index==4){
      //logout
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    }

  }

}

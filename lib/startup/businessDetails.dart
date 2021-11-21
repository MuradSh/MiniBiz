import 'package:flutter/material.dart';
import 'package:minibiz/widgets/TextFieldEnhanced.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minibiz/widgets/PageHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:minibiz/main/feed.dart';
import 'package:minibiz/main/bottomNavBar.dart';

class BusinessDetails extends StatefulWidget {
  final TextEditingController username;
  final TextEditingController pass;
  final TextEditingController phone;

  const BusinessDetails(this.username,this.pass,this.phone,{Key? key}) : super(key: key);

  @override
  _BusinessDetailsState createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {

  double _mediaHeight = 0;
  double _mediaWidth = 0;
  String? _selectedValue;
  String? _selectedLocation;

  FirebaseAuth _auth = FirebaseAuth.instance;
  final _bioFieldController = TextEditingController();

  _signup() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String emailFinal = widget.username.text.trim()+"@minibizwebsite.com";
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
                Text("Loading",style: TextStyle(fontSize: 25),),
              ],
            ),
          ),
        );
      },
    );

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailFinal,
          password: widget.pass.text
      );

      var userId = _auth.currentUser!.uid;
      print(userId);
      Navigator.pop(context);
      CollectionReference usersFB = FirebaseFirestore.instance.collection('businesses');
      usersFB.doc(userId)
          .set({
        "name": widget.username.text,
        "password": widget.pass.text,
        "phone": widget.phone.text,
        "description": _bioFieldController.text,
        "city": _selectedLocation,
        "type": _selectedValue,
      })
          .onError((error, stackTrace) => print(error))
          .then((value) {
        Navigator.push(context, new MaterialPageRoute(
            builder: (context) =>
            new bottomNavBar()
        ));
        print("doneee");
        prefs.setString("name", widget.username.text);
        prefs.setString("type", "business");
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
        body: SingleChildScrollView(
          child:SafeArea(
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/MinibizEdited.png"),
                  height: _mediaHeight*0.13,
                  width: _mediaHeight*0.13,
                ),
                SizedBox(height: 15),
                  Center(
                    child:
                    Text(
                      "Just few more steps",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          fontFamily: 'Roboto'
                      ),
                    ),
                  ),
                 SizedBox(height: 15),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   child:
                   Column(
                   children: [
                     Text(
                      "Tell us what best describes your business?",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                          fontWeight: FontWeight.w400,
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
                       controller: _bioFieldController,
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
                  items: <String>["Aberdeen", "Abilene", "Akron", "Albany", "Albuquerque", "Alexandria", "Allentown", "Amarillo", "Anaheim", "Anchorage", "Ann Arbor", "Antioch", "Apple Valley", "Appleton", "Arlington", "Arvada", "Asheville", "Athens", "Atlanta", "Atlantic City", "Augusta", "Aurora", "Austin", "Bakersfield", "Baltimore", "Barnstable", "Baton Rouge", "Beaumont", "Bel Air", "Bellevue", "Berkeley", "Bethlehem", "Billings", "Birmingham", "Bloomington", "Boise", "Boise City", "Bonita Springs", "Boston", "Boulder", "Bradenton", "Bremerton", "Bridgeport", "Brighton", "Brownsville", "Bryan", "Buffalo", "Burbank", "Burlington", "Cambridge", "Canton", "Cape Coral", "Carrollton", "Cary", "Cathedral City", "Cedar Rapids", "Champaign", "Chandler", "Charleston", "Charlotte", "Chattanooga", "Chesapeake", "Chicago", "Chula Vista", "Cincinnati", "Clarke County", "Clarksville", "Clearwater", "Cleveland", "College Station", "Colorado Springs", "Columbia", "Columbus", "Concord", "Coral Springs", "Corona", "Corpus Christi", "Costa Mesa", "Dallas", "Daly City", "Danbury", "Davenport", "Davidson County", "Dayton", "Daytona Beach", "Deltona", "Denton", "Denver", "Des Moines", "Detroit", "Downey", "Duluth", "Durham", "El Monte", "El Paso", "Elizabeth", "Elk Grove", "Elkhart", "Erie", "Escondido", "Eugene", "Evansville", "Fairfield", "Fargo", "Fayetteville", "Fitchburg", "Flint", "Fontana", "Fort Collins", "Fort Lauderdale", "Fort Smith", "Fort Walton Beach", "Fort Wayne", "Fort Worth", "Frederick", "Fremont", "Fresno", "Fullerton", "Gainesville", "Garden Grove", "Garland", "Gastonia", "Gilbert", "Glendale", "Grand Prairie", "Grand Rapids", "Grayslake", "Green Bay", "GreenBay", "Greensboro", "Greenville", "Gulfport-Biloxi", "Hagerstown", "Hampton", "Harlingen", "Harrisburg", "Hartford", "Havre de Grace", "Hayward", "Hemet", "Henderson", "Hesperia", "Hialeah", "Hickory", "High Point", "Hollywood", "Honolulu", "Houma", "Houston", "Howell", "Huntington", "Huntington Beach", "Huntsville", "Independence", "Indianapolis", "Inglewood", "Irvine", "Irving", "Jackson", "Jacksonville", "Jefferson", "Jersey City", "Johnson City", "Joliet", "Kailua", "Kalamazoo", "Kaneohe", "Kansas City", "Kennewick", "Kenosha", "Killeen", "Kissimmee", "Knoxville", "Lacey", "Lafayette", "Lake Charles", "Lakeland", "Lakewood", "Lancaster", "Lansing", "Laredo", "Las Cruces", "Las Vegas", "Layton", "Leominster", "Lewisville", "Lexington", "Lincoln", "Little Rock", "Long Beach", "Lorain", "Los Angeles", "Louisville", "Lowell", "Lubbock", "Macon", "Madison", "Manchester", "Marina", "Marysville", "McAllen", "McHenry", "Medford", "Melbourne", "Memphis", "Merced", "Mesa", "Mesquite", "Miami", "Milwaukee", "Minneapolis", "Miramar", "Mission Viejo", "Mobile", "Modesto", "Monroe", "Monterey", "Montgomery", "Moreno Valley", "Murfreesboro", "Murrieta", "Muskegon", "Myrtle Beach", "Naperville", "Naples", "Nashua", "Nashville", "New Bedford", "New Haven", "New London", "New Orleans", "New York", "New York City", "Newark", "Newburgh", "Newport News", "Norfolk", "Normal", "Norman", "North Charleston", "North Las Vegas", "North Port", "Norwalk", "Norwich", "Oakland", "Ocala", "Oceanside", "Odessa", "Ogden", "Oklahoma City", "Olathe", "Olympia", "Omaha", "Ontario", "Orange", "Orem", "Orlando", "Overland Park", "Oxnard", "Palm Bay", "Palm Springs", "Palmdale", "Panama City", "Pasadena", "Paterson", "Pembroke Pines", "Pensacola", "Peoria", "Philadelphia", "Phoenix", "Pittsburgh", "Plano", "Pomona", "Pompano Beach", "Port Arthur", "Port Orange", "Port Saint Lucie", "Port St. Lucie", "Portland", "Portsmouth", "Poughkeepsie", "Providence", "Provo", "Pueblo", "Punta Gorda", "Racine", "Raleigh", "Rancho Cucamonga", "Reading", "Redding", "Reno", "Richland", "Richmond", "Richmond County", "Riverside", "Roanoke", "Rochester", "Rockford", "Roseville", "Round Lake Beach", "Sacramento", "Saginaw", "Saint Louis", "Saint Paul", "Saint Petersburg", "Salem", "Salinas", "Salt Lake City", "San Antonio", "San Bernardino", "San Buenaventura", "San Diego", "San Francisco", "San Jose", "Santa Ana", "Santa Barbara", "Santa Clara", "Santa Clarita", "Santa Cruz", "Santa Maria", "Santa Rosa", "Sarasota", "Savannah", "Scottsdale", "Scranton", "Seaside", "Seattle", "Sebastian", "Shreveport", "Simi Valley", "Sioux City", "Sioux Falls", "South Bend", "South Lyon", "Spartanburg", "Spokane", "Springdale", "Springfield", "St. Louis", "St. Paul", "St. Petersburg", "Stamford", "Sterling Heights", "Stockton", "Sunnyvale", "Syracuse", "Tacoma", "Tallahassee", "Tampa", "Temecula", "Tempe", "Thornton", "Thousand Oaks", "Toledo", "Topeka", "Torrance", "Trenton", "Tucson", "Tulsa", "Tuscaloosa", "Tyler", "Utica", "Vallejo", "Vancouver", "Vero Beach", "Victorville", "Virginia Beach", "Visalia", "Waco", "Warren", "Washington", "Waterbury", "Waterloo", "West Covina", "West Valley City", "Westminster", "Wichita", "Wilmington", "Winston", "Winter Haven", "Worcester", "Yakima", "Yonkers", "York", "Youngstown"].map((String value) {
                    return DropdownMenuItem<String>(

                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),


                SizedBox(height: _mediaHeight*0.03,),

                TextButton(
                    onPressed: (){
                      _signup();
                    },
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

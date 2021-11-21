import 'package:flutter/material.dart';
import 'package:minibiz/main/BusinessProfile.dart';
import 'package:minibiz/main/feed.dart';
import 'package:flutter/material.dart';

class bottomNavBar extends StatefulWidget {
  static const String idScreen = "bottomNavbar";

  const bottomNavBar({Key? key}) : super(key: key);

  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  List<Widget> _widgetOptions = <Widget>[
    feed(),
    BusinessProfile(),
  ];

  int _selectedIndex = 0;
  int _selectedPage = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}

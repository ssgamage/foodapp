import 'package:flutter/material.dart';
import 'package:foodapp/pages/userFlow/homeFlow/user_home_page1.dart';
import 'package:foodapp/pages/userFlow/settings/user_main_setting.dart';
import 'package:foodapp/pages/userFlow/user_reservation_page.dart';

class UserMainHomePage extends StatefulWidget {
  @override
  _UserMainHomePageState createState() => _UserMainHomePageState();
}

class _UserMainHomePageState extends State<UserMainHomePage> {
  int _selectedIndex = 0;

  //static List
  // const List
  static List<Widget> _widgetOptions = <Widget>[
    //Text('Home Page'),
    UserMainHomePage1(),
    UserReservePage1(),
    UserSettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Reserved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

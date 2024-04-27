import 'package:flutter/material.dart';
import 'package:foodapp/pages/sellerFlow/home_page_seller1.dart';
import 'package:foodapp/pages/sellerFlow/reserved_page.dart';
import 'package:foodapp/pages/sellerFlow/settings/main_setting_page.dart';

class SellerMainHomePage extends StatefulWidget {
  @override
  _SellerMainHomePageState createState() => _SellerMainHomePageState();
}

class _SellerMainHomePageState extends State<SellerMainHomePage> {
  int _selectedIndex = 0;

  //static List
  // const List
  static List<Widget> _widgetOptions = <Widget>[
    //Text('Home Page'),
    SellerMainHomePage1(),
    ReservedPage(),
    SellerSettingPage(),
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

import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/validationFlow/forgot_pw.dart';
import 'package:foodapp/pages/validationFlow/login_page.dart';

class UserBottomNavigationBar extends StatefulWidget {
  const UserBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<UserBottomNavigationBar> createState() =>
      _UserBottomNavigationBarState();
}

class _UserBottomNavigationBarState extends State<UserBottomNavigationBar> {
  int myIndex = 0;
  List<Widget> widgetList = [
    LoginPage(title: ""),
    ForgotPasswordPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationBar(
        backgroundColor: CustomColor.orangeMain,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
        ],
      ),
    );
  }
}

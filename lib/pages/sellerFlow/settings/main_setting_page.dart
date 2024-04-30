import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/settings/about_app_page.dart';
import 'package:foodapp/pages/sellerFlow/settings/help_and_support.dart';
import 'package:foodapp/pages/sellerFlow/settings/languages_page.dart';
import 'package:foodapp/pages/sellerFlow/settings/my_account_page.dart';

class SellerSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: CustomColor.textBlack,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              width: 350,
              height: 100,
              padding:
                  const EdgeInsets.only(right: 100, left: 5, top: 5, bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: CustomColor.orangeMain,
                  width: 0,
                ),
                color: CustomColor.orangeMain,
              ),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          //  backgroundImage: AssetImage('assets/your_image.png'),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Green House',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CustomColor.textWhite,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'greenhouse@gmail.com',
                              style: TextStyle(
                                fontSize: 14,
                                color: CustomColor.textWhite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              color: CustomColor.textWhite,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 0),
                      width: 300,
                      height: 65,
                      color: CustomColor.textWhite,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 10),
                              Text(
                                'My Account',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyAccountPage()),
                                      );
                                      print('My Account');
                                    },
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 55, 0),
                            child: Text(
                              'Make changes to your account',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      print('Change Password');
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 0),
                      width: 300,
                      height: 65,
                      color: CustomColor.textWhite,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lock),
                              SizedBox(width: 10),
                              Text(
                                'Change Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 45, 0),
                            child: Text(
                              'Make changes to your password',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      print('Help & Support');
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 0),
                      width: 300,
                      height: 65,
                      color: CustomColor.textWhite,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.warning),
                              SizedBox(width: 10),
                              Text(
                                'Help & Support',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SellerHelpAndSupportPage()),
                                      );
                                    },
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 95, 0),
                            child: Text(
                              'Privacy & security help',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      // Add your action for the third button here
                      print('language');
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 0),
                      width: 300,
                      height: 65,
                      color: CustomColor.textWhite,
                      child: Column(
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.language), // Add your icon here
                              SizedBox(width: 10),
                              Text(
                                'Languages',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),

                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SellerLanguagePage()),
                                      );
                                    },
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 85, 0),
                            child: Text(
                              'Change  to your language',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 0),
                      width: 300,
                      height: 65,
                      color: CustomColor.textWhite,
                      child: Column(
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.apps), // Add your icon here
                              SizedBox(width: 10),
                              Text(
                                'About App',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AboutAppPage()),
                                      );
                                    },
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 0),
                  InkWell(
                    onTap: () {
                      print('Log out');
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 0),
                      width: 300,
                      height: 65,
                      color: CustomColor.textWhite,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.logout),
                              SizedBox(width: 10),
                              Text(
                                'Log out',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: Text(
                              'Further secure your account for safety',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

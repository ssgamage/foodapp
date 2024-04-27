import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/settings/about_app_page.dart';
import 'package:foodapp/pages/userFlow/settings/help_support_user.dart';
import 'package:foodapp/pages/userFlow/settings/profile_view_page.dart';
import 'package:foodapp/pages/userFlow/settings/user_language.dart';

class UserSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ,
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
          mainAxisAlignment: MainAxisAlignment
              .start, // Aligns children to the start (top) of the column
          crossAxisAlignment: CrossAxisAlignment
              .center, // Aligns children to the center horizontally
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              width: 350,
              height: 100,
              padding: const EdgeInsets.only(
                  right: 60, left: 0, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: CustomColor.orangeMain, // Set border color here
                  width: 0, // Set border width here
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
                          backgroundImage: AssetImage(
                              'assets/images/userflow/ca1.png'), // Add image here
                          radius: 40, // Adjust the radius as needed
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' Chathurika Alwis', // Change the name here
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CustomColor.textWhite,
                                fontSize: 20,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                                '@chathu.ac.lk',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColor.textWhite,
                                ),
                              ),
                            ),
                          ],
                        )
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
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      // Add your action for the first button here
                      print('My Account');
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
                              Icon(Icons.person), // Add your icon here
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
                                                UserProfileView()),
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
                      // Add your action for the second button here
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
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lock), // Add your icon here
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
                              Icon(Icons.warning), // Add your icon here
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
                                                UserLanguagePage()),
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
                    onTap: () {
                      // Add your action for the fourth button here
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
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.language), // Add your icon here
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
                                      //UserHelpAndSupportPage
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserHelpAndSupportPage()),
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
                      // Add your action for the fifth button here
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
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout), // Add your icon here
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

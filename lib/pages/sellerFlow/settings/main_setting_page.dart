import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';

void main() {
  runApp(SettingsPage());
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Page',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //button 01
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 0, top: 0, bottom: 0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for the first button here
                        print('Button 1');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 65),
                        foregroundColor: CustomColor.textBlack,
                        backgroundColor: CustomColor.textWhite,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.man), // Add your icon here
                          SizedBox(width: 10),
                          Text(
                            'My Account',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //button 02
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 0, top: 0, bottom: 0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for the first button here
                        print('Button 2');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 65),
                        foregroundColor: CustomColor.textBlack,
                        backgroundColor: CustomColor.textWhite,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //button 03
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 0, top: 0, bottom: 0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for the first button here
                        print('Button 3');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 65),
                        foregroundColor: CustomColor.textBlack,
                        backgroundColor: CustomColor.textWhite,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.help), // Add your icon here
                          SizedBox(width: 10),
                          Text(
                            'Help & Support',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //button 04
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 0, top: 0, bottom: 0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for the first button here
                        print('Button 4');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 65),
                        foregroundColor: CustomColor.textBlack,
                        backgroundColor: CustomColor.textWhite,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //button 05
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 0, top: 0, bottom: 0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for the first button here
                        print('Button 5');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(250, 65),
                        foregroundColor: CustomColor.textBlack,
                        backgroundColor: CustomColor.textWhite,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

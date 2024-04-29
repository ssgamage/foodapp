import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/adminFlow/admin_sellermanagement_page.dart';
import 'package:foodapp/pages/adminFlow/admin_usermanagement_page.dart';
import 'package:foodapp/pages/adminFlow/report_page.dart';
import 'package:foodapp/pages/adminFlow/reserve_list_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 218, 218),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 219, 218, 218),
        title: Text(
          'Admin Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: CustomColor.textBlack,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserManagement()),
                );
                print('Button 1 pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.orangeMain,
                fixedSize: Size(300, 75),
              ),
              child: Text(
                'User Management',
                style: TextStyle(
                  color: CustomColor.textWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupplierManagement()),
                );
                print('Button 2 pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.orangeMain,
                fixedSize: Size(300, 75),
              ),
              child: Text(
                'Supplier Management',
                style: TextStyle(
                  color: CustomColor.textWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReserveDetailsPage()),
                );
                print('Button 3 pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.orangeMain,
                fixedSize: Size(300, 75),
              ),
              child: Text(
                'Reserved Details',
                style: TextStyle(
                  color: CustomColor.textWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportPage()),
                );
                print('Button 4 pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.orangeMain,
                fixedSize: Size(300, 75),
              ),
              child: Text(
                'Reports',
                style: TextStyle(
                  color: CustomColor.textWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

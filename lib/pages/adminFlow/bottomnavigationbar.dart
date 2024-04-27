import 'package:flutter/material.dart';
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
              child: Text('User Management'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupplierManagement()),
                );
                print('Button 2 pressed');
              },
              child: Text('Supplier Management'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReserveDetailsPage()),
                );
                print('Button 3 pressed');
              },
              child: Text('Reserved Details'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportPage()),
                );
                print('Button 4 pressed');
              },
              child: Text('Reports'),
            ),
          ],
        ),
      ),
    );
  }
}

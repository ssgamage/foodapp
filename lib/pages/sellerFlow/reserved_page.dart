import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/notification_page.dart';
import 'package:foodapp/pages/sellerFlow/order_conformation_page.dart';

class ReservedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 221, 201),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 221, 201),
        title: Text(
          'Reserve',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: CustomColor.textBlack,
            fontFamily: 'Roboto',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          SizedBox(
            width: 100,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 236, 162, 14)),
                borderRadius: BorderRadius.circular(7),
                color: Color.fromARGB(255, 243, 236, 236),
              ),
              child: Center(
                child: Text(
                  'Today',
                  style: TextStyle(color: Color.fromARGB(255, 247, 150, 46)),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderConformPage()),
                  );
                },
                child: Card(
                  color: Color.fromARGB(255, 240, 236, 229),
                  child: ListTile(
                    title: Text(
                      'Chathurika Alwis',
                      style: TextStyle(
                        color: Color.fromARGB(255, 211, 151, 40),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('11.35 A.M'),
                        Icon(Icons.check_circle, color: Colors.green),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Color.fromARGB(255, 240, 236, 229),
                child: ListTile(
                  title: Text('AI Perera'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('11.00 A.M'),
                      Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(255, 240, 236, 229),
                child: ListTile(
                  title: Text('GHK Dilshan'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('10.30 A.M'),
                      Icon(Icons.cancel, color: Colors.red),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(255, 240, 236, 229),
                child: ListTile(
                  title: Text('HIGK Reshan'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('1.45 P.M'),
                      Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(255, 240, 236, 229),
                child: ListTile(
                  title: Text('WJG Amalkith'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('3.00 P.M'),
                      Icon(Icons.cancel, color: Colors.red),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(255, 240, 236, 229),
                child: ListTile(
                  title: Text('YK Gunarathna'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('4.30 P.M'),
                      Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(255, 240, 236, 229),
                child: ListTile(
                  title: Text('DD Tennakoon'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('5.14 P.M'),
                      Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

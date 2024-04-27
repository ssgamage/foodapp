import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/order_report_page.dart';
import 'package:foodapp/pages/sellerFlow/reserved_page.dart';

class OrderConformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chathurika Alwis',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: CustomColor.textBlack,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: CustomColor.orangeMain,
          ),
          onPressed: () {
            // Handle back button press
            print('Back button pressed');
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Change image URL
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Chathurika Alwis',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'chathurikaalwis@email.com',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: CustomColor.textBlack,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.only(left: 5),
              ),
              readOnly: EditableText.debugDeterministicCursor,
              initialValue: 'Chathurika Alwis',
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: CustomColor.textBlack,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.only(left: 5),
              ),
              readOnly: EditableText.debugDeterministicCursor,
              initialValue: 'Chathurikaalwis@gmail.com',
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: CustomColor.textBlack,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.only(left: 5),
              ),
              readOnly: false,
              initialValue: '+94  | 704560305',
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Your Address',
                labelStyle: TextStyle(
                  color: CustomColor.textBlack,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.only(left: 5),
              ),
              readOnly: false,
              initialValue: 'No 157/2 Pitipana - thalagala Rd, Homagama',
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                labelStyle: TextStyle(
                  color: CustomColor.textBlack,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.only(left: 5),
              ),
              readOnly: false,
              initialValue: '01/06/2000',
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReservedPage()),
                );
                print('Confirm button pressed');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 20),
                foregroundColor: CustomColor.textWhite,
                backgroundColor: CustomColor.orangeMain,
              ),
              child: Text(
                'Confirm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderReportPage()),
                );
                print('Report button pressed');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 40),
                foregroundColor: CustomColor.textWhite,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Report',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 175,
            ),
          ],
        ),
      ),
    );
  }
}

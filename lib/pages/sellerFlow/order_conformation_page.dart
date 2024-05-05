import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; //
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/order_report_page.dart';
import 'package:foodapp/pages/sellerFlow/reserved_page.dart';

class OrderConformPage extends StatefulWidget {
  final userData;

  const OrderConformPage({required this.userData});

  @override
  State<OrderConformPage> createState() => _OrderConformPageState();
}

class _OrderConformPageState extends State<OrderConformPage> {
  late Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    //_user = FirebaseAuth.instance.currentUser!;
    _getUserData();
  }

  Future<void> _getUserData() async {
    DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
        .collection(
            'users') // Assuming user data is stored in the 'users' collection
        .doc(widget.userData.uid) // Use user's UID to retrieve their document
        .get();

    setState(() {
      _userData = userDataSnapshot.data() as Map<String, dynamic>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
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
            Navigator.pop(context);
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
                    backgroundImage: NetworkImage(_userData
                            .containsKey('profileImageUrl')
                        ? _userData['profileImageUrl']
                        : 'https://via.placeholder.com/150'), // Change image URL
                  ),
                  SizedBox(height: 10),
                  Text(
                    _userData.containsKey('Name')
                        ? _userData['Name']
                        : 'Name not available',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _userData.containsKey('Email')
                        ? _userData['Email']
                        : 'Email not available',
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
                labelText: 'Meal Time',
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
              readOnly: true,
              initialValue: widget.userData.meal,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Food',
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
              readOnly: true,
              initialValue: widget.userData.catogary,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(
                  color: CustomColor.textBlack,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.only(left: 5),
              ),
              readOnly: true,
              initialValue: widget.userData.qyt,
            ),
          ),
          SizedBox(height: 40),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Contact Number',
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
              readOnly: true,
              initialValue: _userData.containsKey('Phone')
                  ? _userData['Phone']
                  : 'Loading..',
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/userFlow/homeFlow/report_option_page.dart';

class ShopReportPage extends StatefulWidget {
  final userData; // Define the userData parameter here

  const ShopReportPage({required this.userData});

  @override
  _ShopReportPageState createState() => _ShopReportPageState();
}

class _ShopReportPageState extends State<ShopReportPage> {
  //final _qytController = TextEditingController();
  late User _user;
  late Map<String, dynamic> _userData = {}; // Store user data
  late Map<String, dynamic> _sellerData = {};

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    _getSellerData();
    _getOrderData();
  }

  Future<void> _getSellerData() async {
    DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
        .collection(
            'sellers') // Assuming user data is stored in the 'users' collection
        .doc(widget.userData.sid) // Use user's UID to retrieve their document
        .get();

    setState(() {
      _sellerData = userDataSnapshot.data() as Map<String, dynamic>;
    });
  }

  Future<void> _getOrderData() async {
    DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
        .collection('breakfast')
        .doc('ricencurry')
        .collection('rnc')
        .doc(widget.userData.sid) // Use user's UID to retrieve their document
        .get();

    setState(() {
      _userData = userDataSnapshot.data() as Map<String, dynamic>;
    });
  }

  /*Future<void> _addSellerNotification() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      // Save food details to Firestore
      await FirebaseFirestore.instance
          .collection('breakfast')
          .doc('ricencurry')
          .collection('rnc')
          .doc(widget.userData.docId)
          .collection('notifications')
          .doc()
          .set({
        'Meal': "Breakfast",
        'Catogary': "Rice And Curry",
        'Qyt': _qytController.text,
        'uid': currentUser!.uid,
      });

      // Navigate to the FoodSavePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DistancePage()),
      );
    } catch (error) {
      // Handle any errors that occur during saving
      print('Error Reserving: $error');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle your arrow button press here
            // For example, you can navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        title: Text('Order Review'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Restaurant View',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width *
                0.6, // Adjust width as needed
            height: 250, // Adjust height as needed
            child: Image.network(
              //_userData['imageUrl'],
              _userData.containsKey('imageUrl')
                  ? _userData['imageUrl']
                  : 'data:image/png;base64,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',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              _sellerData.containsKey('Name')
                  ? _sellerData['Name']
                  : 'Name not available',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: _sellerData['Description'],
                  ),
                  TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: 'Contact Number - ',
                  ),
                  TextSpan(
                    text: _sellerData['Phone'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Change the border color here
              ),
              color: Colors.grey[200], // Set the background color here
            ),
            child: Column(
              children: [
                Text(
                  'Hey, Today available curries: \n',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold, // Bold the text
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  _userData.containsKey('description')
                      ? _userData['description']
                      : 'Details not available',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold, // Bold the text
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _userData.containsKey('price') ? _userData['price'] : '0',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red, // Change text color to red
                        fontWeight: FontWeight.bold, // Bold the text
                      ),
                    ),
                    Text(
                      'Quantity: ${widget.userData.qyt}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold, // Bold the text
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  // Add some space between the buttons and the new row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // UserReservePage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportOptionsPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text('Report'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

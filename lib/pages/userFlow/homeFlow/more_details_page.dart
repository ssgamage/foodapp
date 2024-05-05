import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/userFlow/homeFlow/distance_page.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopMoreDetails extends StatefulWidget {
  final userData; // Define the userData parameter here

  const ShopMoreDetails({required this.userData});

  @override
  _ShopMoreDetailsState createState() => _ShopMoreDetailsState();
}

class _ShopMoreDetailsState extends State<ShopMoreDetails> {
  TextEditingController _qytController = TextEditingController();
  //final _qytController = TextEditingController();
  late User _user;
  late Map<String, dynamic> _userData = {}; // Store user data

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    _getUserData();
  }

  @override
  void dispose() {
    _qytController.dispose();
    super.dispose();
  }

  Future<void> _launchMaps(double latitude, double longitude) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _getUserData() async {
    DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
        .collection(
            'sellers') // Assuming user data is stored in the 'users' collection
        .doc(widget.userData.docId) // Use user's UID to retrieve their document
        .get();

    setState(() {
      _userData = userDataSnapshot.data() as Map<String, dynamic>;
    });
  }

  Future<void> decreaseQuantity() async {
    try {
      // Get the reference to the document
      DocumentReference docRef = FirebaseFirestore.instance
          .collection('breakfast')
          .doc('ricencurry')
          .collection('rnc')
          .doc(widget.userData.docId);

      // Get the current quantity
      int currentQuantity = int.parse(widget.userData.qyt);
      int reservedQuantity = int.parse(_qytController.text);

      // Update the quantity in the database by decrementing by 1
      await docRef.update(
          {'quantity': (currentQuantity - reservedQuantity).toString()});
    } catch (error) {
      print('Error decreasing quantity: $error');
      // Handle error//
    }
  }

  Future<void> _addSellerNotification() async {
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DistancePage()),
      );
    } catch (error) {
      // Handle any errors that occur during saving
      print('Error Reserving: $error');
    }
  }

  Future<void> _addUserNotification() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      // Save food details to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .collection('notifications')
          .doc()
          .set({
        'Meal': "Breakfast",
        'Catogary': "Rice And Curry",
        'Qyt': _qytController.text,
        'sid': widget.userData.docId,
      });
    } catch (error) {
      // Handle any errors that occur during saving
      print('Error Reserving: $error');
    }
  }

  Future<void> _addAdminTableDetails() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      // Ensure a valid user is logged in
      if (currentUser == null) {
        print('Error: User not logged in. Please sign in first.');
        return; // Exit the function if no user is logged in
      }

      // Import the DateFormat class
      final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

      // Get the current date and time
      final now = DateTime.now();
      final formattedTime = formatter.format(now);

      // Save food details to Firestore
      await FirebaseFirestore.instance
          .collection('logs')
          .doc() // Generate a new document ID automatically
          .set({
        'meal': "Breakfast",
        'catogary': "Rice And Curry",
        'time': formattedTime,
        'sid': widget.userData.docId,
        'uid': currentUser.uid,
      });

      print('Admin table details added successfully!');
    } catch (error) {
      // Handle any errors that occur during saving
      print('Error adding table details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle your arrow button press here
            // For example, you can navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        title: Text('Breakfast Step 3 / 3'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
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
              widget.userData.foodimage,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              _userData.containsKey('Name')
                  ? _userData['Name']
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
                    text: _userData['Description'],
                  ),
                  TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: 'Contact Number - ',
                  ),
                  TextSpan(
                    text: _userData['Phone'],
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
                  widget.userData.desc,
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
                      'Rs ${widget.userData.price}',
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
                  Container(
                    width: 100.0,
                    height: 30.0,
                    child: TextFormField(
                      controller: _qytController,
                      decoration: InputDecoration(
                        labelText: 'Add Qyt',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0.5, // reduced border height
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          10), // Add some space between the buttons and the new row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final latitude = widget.userData.location.latitude;
                          final longitude = widget.userData.location.longitude;
                          _launchMaps(latitude, longitude);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text('Location'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          decreaseQuantity();
                          // UserReservePage
                          _addSellerNotification();
                          _addUserNotification();
                          _addAdminTableDetails();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text('Reserve'),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDashboardPage extends StatefulWidget {
  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  late User _user;
  late Map<String, dynamic> _userData = {}; // Store user data

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    _getUserData();
  }

  Future<void> _getUserData() async {
    DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
        .collection(
            'users') // Assuming user data is stored in the 'users' collection
        .doc(_user.uid) // Use user's UID to retrieve their document
        .get();

    setState(() {
      _userData = userDataSnapshot.data() as Map<String, dynamic>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${_userData['Name']}!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Phone Number: ${_userData['Phone']}',
              style: TextStyle(fontSize: 18),
            ),
            // Display other user details as needed
          ],
        ),
      ),
    );
  }
}

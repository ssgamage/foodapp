import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/settings/my_account_page1.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  String? _profileImageUrl;
  late Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
    _getUserData();
  }

  void _loadProfileImage() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        final docSnapshot = await FirebaseFirestore.instance
            .collection('sellers')
            .doc(currentUser.uid)
            .get();
        final data = docSnapshot.data();
        if (data != null && data.containsKey('profileImageUrl')) {
          setState(() {
            _profileImageUrl = data['profileImageUrl'];
          });
        }
      } catch (e) {
        print('Error fetching profile image URL: $e');
      }
    }
  }

  Future<void> _getUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final String uid = currentUser.uid;
      DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
          .collection(
              'sellers') // Assuming user data is stored in the 'users' collection
          .doc(uid) // Use user's UID to retrieve their document
          .get();

      setState(() {
        _userData = userDataSnapshot.data() as Map<String, dynamic>;
      });
    } else {
      print('Current user is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.orange,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text('My Account'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                backgroundImage: _profileImageUrl != null
                    ? NetworkImage(_profileImageUrl!)
                    : AssetImage(
                            'https://as2.ftcdn.net/v2/jpg/03/59/58/91/1000_F_359589186_JDLl8dIWoBNf1iqEkHxhUeeOulx0wOC5.jpg')
                        as ImageProvider, // Cast AssetImage to ImageProvider
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // View Profile button action
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.backgroundOther,
                      foregroundColor: Colors.white),
                  child: const Text('View Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccountPage1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white),
                  child: const Text('Edit Profile'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name: ${_userData['Name']}',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
                readOnly: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText:
                      'Description: ${_userData.containsKey('Description') ? _userData['Description'] : 'Unavalilable'}',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
                readOnly: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Telephone: ${_userData['Phone']}',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
                readOnly: true,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email: ${_userData['Email']}',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
                readOnly: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

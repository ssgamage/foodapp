import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; //
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/userFlow/settings/profile_edit_page.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
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
            .collection('users')
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
              'users') // Assuming user data is stored in the 'users' collection
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_sharp),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'My Account',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  backgroundImage: _profileImageUrl != null
                      ? NetworkImage(_profileImageUrl!)
                      : AssetImage(
                              'https://as2.ftcdn.net/v2/jpg/03/59/58/91/1000_F_359589186_JDLl8dIWoBNf1iqEkHxhUeeOulx0wOC5.jpg')
                          as ImageProvider, // Cast AssetImage to ImageProvider
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      _userData.containsKey('Name')
                          ? _userData['Name']
                          : 'Loading..',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1),
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        _userData.containsKey('Email')
                            ? _userData['Email']
                            : 'Loading..',
                        style: TextStyle(
                            fontSize: 14.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('View Profile button pressed');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColor.backgroundOther),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text('View Profile'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfileEdit()),
                          );
                          print('Edit Profile button pressed');
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Name:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                              width: 5), // Add spacing between label and value
                          Text(
                            _userData.containsKey('Name')
                                ? _userData['Name']
                                : 'Loading..',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 15), // Add some vertical spacing between fields
                    Container(
                      padding: EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Email:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            _userData.containsKey('Email')
                                ? _userData['Email']
                                : 'Loading..',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Phone:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            _userData.containsKey('Phone')
                                ? _userData['Phone']
                                : 'Loading..',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Address:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            _userData.containsKey('Address')
                                ? _userData['Address']
                                : 'Data Not available',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ), // Add some vertical spacing after the last field
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

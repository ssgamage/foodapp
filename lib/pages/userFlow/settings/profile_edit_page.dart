import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart'; //
import 'package:foodapp/pages/userFlow/settings/profile_view_page.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileEdit extends StatefulWidget {
  const UserProfileEdit({Key? key}) : super(key: key);

  @override
  _UserProfileEditState createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  File? _imageFile;
  late Map<String, dynamic> _userData = {};
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addSellerNotification();
    _getUserData();
  }

  // Function to select image from gallery
  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      // Upload the image to Firebase Storage
      final currentUser = FirebaseAuth.instance.currentUser;
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${currentUser!.uid}.jpg');
      await storageRef.putFile(_imageFile!);

      // Get the download URL of the uploaded image
      final imageUrl = await storageRef.getDownloadURL();

      // Save the download URL in Firestore (You need to implement this part)
      // Example:
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({'profileImageUrl': imageUrl});
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

  Future<void> _addSellerNotification() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final String uid = currentUser.uid;

        Map<String, dynamic> updateData = {};

        // Check if the text controllers are not empty and add them to the update data
        if (_addressController.text.isNotEmpty) {
          updateData['Address'] = _addressController.text;
        }
        if (_emailController.text.isNotEmpty) {
          updateData['Email'] = _emailController.text;
        }
        if (_nameController.text.isNotEmpty) {
          updateData['Name'] = _nameController.text;
        }
        if (_phoneController.text.isNotEmpty) {
          updateData['Phone'] = _phoneController.text;
        }

        // Update Firestore document only if there is data to update
        if (updateData.isNotEmpty) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .update(updateData);

          // Optionally, update the user data stored in the _userData map
          setState(() {
            _userData.addAll(updateData);
          });
        } else {
          print('No data to update');
        }
      } else {
        print('Current user is null');
      }
    } catch (error) {
      // Handle any errors that occur during saving
      print('Error saving data: $error');
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
                GestureDetector(
                  onTap: _selectImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!) // Use FileImage for Image.file
                        : NetworkImage(
                                'https://as2.ftcdn.net/v2/jpg/03/59/58/91/1000_F_359589186_JDLl8dIWoBNf1iqEkHxhUeeOulx0wOC5.jpg')
                            as ImageProvider, // Cast NetworkImage to ImageProvider
                  ),
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText:
                          'Enter Name: ${_userData.containsKey('Name') ? _userData['Name'] : 'Unavalilable'}',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText:
                              'Enter Email: ${_userData.containsKey('Email') ? _userData['Email'] : 'Unavalilable'}',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 15), // Add some vertical spacing between fields
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText:
                              'Enter Contact Number: ${_userData.containsKey('Phone') ? _userData['Phone'] : 'Unavalilable'}',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText:
                              'Enter Address: ${_userData.containsKey('Address') ? _userData['Address'] : 'Unavalilable!'}',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20.0),
                        ),
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
                            'Date of Birth:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            _userData.containsKey('DOB')
                                ? _userData['DOB']
                                : 'This input field no available yet!',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          _addSellerNotification();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfileView()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white),
                        child: const Text('Save'),
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

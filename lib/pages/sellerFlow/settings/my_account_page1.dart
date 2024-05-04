import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/settings/main_setting_page.dart';
import 'package:foodapp/pages/sellerFlow/settings/my_account_page.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountPage1 extends StatefulWidget {
  const MyAccountPage1({Key? key}) : super(key: key);

  @override
  _MyAccountPage1State createState() => _MyAccountPage1State();
}

class _MyAccountPage1State extends State<MyAccountPage1> {
  File? _imageFile;
  late Map<String, dynamic> _userData = {};
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descController = TextEditingController();
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
          .collection('sellers')
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

  Future<void> _addSellerNotification() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final String uid = currentUser.uid;

        Map<String, dynamic> updateData = {};

        // Check if the text controllers are not empty and add them to the update data
        if (_descController.text.isNotEmpty) {
          updateData['Description'] = _descController.text;
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
              .collection('sellers')
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
            const Text('Account Edit'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
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
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccountPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white),
                  child: const Text('View Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // View Profile button action
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.backgroundOther,
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
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter Shop Name: ${_userData['Name']}',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextFormField(
                controller: _descController,
                decoration: InputDecoration(
                  labelText:
                      'Enter Description: ${_userData.containsKey('Description') ? _userData['Description'] : 'Unavalilable'}',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Enter Contact Number: ${_userData['Phone']}',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Enter Email: ${_userData['Email']}',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _addSellerNotification();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SellerSettingPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountPage1 extends StatefulWidget {
  const MyAccountPage1({Key? key}) : super(key: key);

  @override
  _MyAccountPage1State createState() => _MyAccountPage1State();
}

class _MyAccountPage1State extends State<MyAccountPage1> {
  File? _imageFile;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.orange,
              ),
              onPressed: () {
                // Add navigation logic here
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
          children: [
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : Placeholder(
                    fallbackHeight: 100,
                    fallbackWidth: 100,
                  ),
            ElevatedButton(
              onPressed: _selectImage,
              child: Text(_imageFile == null ? 'Add Image' : 'Change Image'),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Shop Name',
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
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter About',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Number 1',
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
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Number 2',
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
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Gmail',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

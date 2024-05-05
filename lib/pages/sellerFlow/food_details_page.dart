import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/food_save_page.dart';
import 'package:foodapp/pages/sellerFlow/set_location_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class FoodAddPage extends StatefulWidget {
  final LatLng selectedLocation;

  FoodAddPage({required this.selectedLocation});

  @override
  State<FoodAddPage> createState() => _FoodAddPageState();
}

class _FoodAddPageState extends State<FoodAddPage> {
  File? _imageFile;
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  late LatLng _selectedLocation;

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.selectedLocation; // Initialize selectedLocation
  }

  @override
  void dispose() {
    // Clean up controllers when widget is disposed
    _priceController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // Function to handle image selection from gallery
  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Function to handle saving the food details to Firebase
  Future<void> _saveFoodDetails() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final fileName = _imageFile!.path.split('/').last;

      // Upload image to Firebase Storage
      final storageRef =
          FirebaseStorage.instance.ref().child('rnc').child(fileName);
      await storageRef.putFile(_imageFile!);

      // Get the download URL of the uploaded image
      final imageUrl = await storageRef.getDownloadURL();

      // Save food details to Firestore
      await FirebaseFirestore.instance
          .collection('breakfast')
          .doc('ricencurry')
          .collection('rnc')
          .doc(currentUser?.uid)
          .set({
        'imageUrl': imageUrl,
        'price': _priceController.text,
        'food': "Rice & Curry",
        'quantity': _quantityController.text,
        'description': _descriptionController.text,
        'location':
            GeoPoint(_selectedLocation.latitude, _selectedLocation.longitude),
      });

      // Navigate to the FoodSavePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FoodSavePage()),
      );
    } catch (error) {
      // Handle any errors that occur during saving
      print('Error saving food details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.ellipse,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Add Your Foods',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: CustomColor.textBlack,
                  ),
                ),
              ],
            ),
            Text(
              'Add Your Meals Menu',
              // Text below the title
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: CustomColor.textBlack,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sellerflow/ellipse7.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    // Meal image
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          _imageFile != null ? FileImage(_imageFile!) : null,
                    ),
                  ),
                ),

                // elevate 01
                Container(
                  child: ElevatedButton(
                    onPressed: _selectImage,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 40),
                      foregroundColor: CustomColor.textWhite,
                      backgroundColor: CustomColor.orangeMain,
                    ),
                    child: Text(
                      'Upload Meal Image',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Add Qty and Add Price TextFormFields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _priceController,
                          decoration: InputDecoration(
                            labelText: ' Add Price',
                            labelStyle: TextStyle(
                              color: CustomColor.textBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.only(left: 5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: _quantityController,
                          decoration: InputDecoration(
                            labelText: ' Add Qty ',
                            labelStyle: TextStyle(
                              color: CustomColor.textBlack,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.only(left: 5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Add description text
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: ' Add Description',
                      labelStyle: TextStyle(
                        color: CustomColor.textBlack,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.only(
                          right: 0, left: 5, top: 25, bottom: 50),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // elevate 02
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the SetLocationPage to get the selected location
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetLocationPage(),
                      ),
                    ).then((selectedLocation) {
                      // Update the selected location when SetLocationPage is popped
                      if (selectedLocation != null) {
                        setState(() {
                          _selectedLocation = selectedLocation;
                        });
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 20),
                    foregroundColor: CustomColor.textWhite,
                    backgroundColor: CustomColor.orangeMain,
                  ),
                  child: Text(
                    'Add Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // elevate 03
                ElevatedButton(
                  onPressed: _saveFoodDetails,
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 40),
                    foregroundColor: CustomColor.textWhite,
                    backgroundColor: CustomColor.orangeMain,
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

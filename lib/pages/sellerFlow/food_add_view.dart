import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/sellerFlow/food_selection_page.dart';

class FoodAddSavePage extends StatefulWidget {
  const FoodAddSavePage({
    super.key,
  });

  @override
  State<FoodAddSavePage> createState() => _FoodAddSavePageState();
}

class _FoodAddSavePageState extends State<FoodAddSavePage> {
  late User _user;
  late Map<String, dynamic> _userData = {}; // Store user data

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    _getUserData();
  }

  Future<void> _getUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
        .collection('breakfast')
        .doc('ricencurry')
        .collection(
            'rnc') // Assuming user data is stored in the 'users' collection
        .doc(currentUser!.uid) // Use user's UID to retrieve their document
        .get();

    setState(() {
      _userData = userDataSnapshot.data() as Map<String, dynamic>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 238, 214),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.orange,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SellerFoodSelectionPage()),
            );
          },
        ),
        title: const Text('My Food Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              // Add onTap logic here
            },
            child: SizedBox(
              width: 170.0, // Set initial width
              height: 200.0, // Set initial height
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            _userData.containsKey('imageUrl')
                                ? _userData['imageUrl']
                                : 'https://via.placeholder.com/150'),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        _userData.containsKey('food')
                            ? _userData['food']
                            : 'Loading..',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Rs. ${_userData['price']}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

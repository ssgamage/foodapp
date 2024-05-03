import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/userFlow/homeFlow/more_details_page.dart'; //DistancePage ShopMoreDetails

class DistancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserPage();
  }
}

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future<List<UserData>> _usersFuture;
  List<UserData> users = [];
  List<UserData> filteredUsers = [];
  double verticalPadding = 10.0;

  @override
  void initState() {
    super.initState();
    _usersFuture = getUsersFromFirestore();
  }

  Future<List<UserData>> getUsersFromFirestore() async {
    List<UserData> users = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('breakfast')
        .doc('ricencurry')
        .collection('rnc')
        .get();

    querySnapshot.docs.forEach((doc) {
      users.add(UserData(
        price: doc['price'],
        qyt: doc['quantity'],
        desc: doc['description'],
        location: doc['location'],
        foodimage: doc['imageUrl'],
        docId: doc.id,
      ));
    });

    setState(() {
      this.users = users;
      filteredUsers = users;
    });

    return users;
  }

  void filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredUsers = users;
      } else {
        filteredUsers = users
            .where((user) =>
                user.price.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rice and Curry'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search here...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onChanged: (value) {
                  filterUsers(value);
                },
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return UserCard(
                  userData: filteredUsers[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShopMoreDetails(userData: filteredUsers[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserData {
  final String price;
  final String qyt;
  final String desc;
  final GeoPoint location;
  final String foodimage;
  final docId;

  UserData({
    required this.price,
    required this.qyt,
    required this.foodimage,
    required this.desc,
    required this.location,
    required this.docId,
  });
}

class UserCard extends StatelessWidget {
  final UserData userData;
  final VoidCallback onTap;

  const UserCard({
    required this.userData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                // ignore: unnecessary_null_comparison
                backgroundImage: userData.foodimage != null
                    ? NetworkImage(userData.foodimage)
                    : AssetImage('https://via.placeholder.com/150')
                        as ImageProvider,
              ),
              SizedBox(height: 15),
              Text(
                userData.price,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                userData.qyt,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              Text(
                userData.desc,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

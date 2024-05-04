import 'package:cloud_firestore/cloud_firestore.dart'; //OrderConformPage()
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/notification_page.dart';
import 'package:foodapp/pages/sellerFlow/order_conformation_page.dart';
import 'package:foodapp/pages/sellerFlow/seller_main_home.dart';

class ReservedPage extends StatelessWidget {
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
  late Map<String, dynamic> _userData = {};
  List<UserData> users = [];
  List<UserData> filteredUsers = [];
  double verticalPadding = 10.0;

  @override
  void initState() {
    super.initState();
    //_getUserData();
    _usersFuture = getUsersFromFirestore();
  }

  Future<List<UserData>> getUsersFromFirestore() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    List<UserData> users = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('breakfast')
        .doc('ricencurry')
        .collection('rnc')
        .doc(currentUser!.uid)
        .collection('notifications')
        .get();

    querySnapshot.docs.forEach((doc) {
      users.add(UserData(
        catogary: doc['Catogary'],
        meal: doc['Meal'],
        qyt: doc['Qyt'],
        uid: doc['uid'],
      ));
    });

    setState(() {
      this.users = users;
      filteredUsers = users;
    });

    return users;
  }

  /*Future<void> _getUserData() async {
    DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
        .collection(
            'users') // Assuming user data is stored in the 'users' collection
        .doc("f25z5UBLhveMdttkzWVqVngZgCa2") // here X
        .get();

    setState(() {
      _userData = userDataSnapshot.data() as Map<String, dynamic>;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reserve',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: CustomColor.textBlack,
            fontFamily: 'Roboto',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SellerMainHomePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  vertical: verticalPadding, horizontal: 20),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return UserCard(
                  userData: filteredUsers[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OrderConformPage(userData: filteredUsers[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserData {
  final String catogary;
  final String meal;
  final String qyt;
  final String uid;

  UserData({
    required this.catogary,
    required this.meal,
    required this.qyt,
    required this.uid,
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
        child: Card(
          color: Color.fromARGB(255, 240, 236, 229),
          child: ListTile(
            title: Text(
              userData.meal,
              style: TextStyle(
                color: CustomColor.textBlack,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Status'),
                Icon(
                  userData.qyt == 0
                      ? Icons.cancel
                      : Icons.check_circle, // Use ternary operator
                  color: 1 == 2 ? Colors.red : Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

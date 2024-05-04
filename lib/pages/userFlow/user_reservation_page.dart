import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/userFlow/homeFlow/shop_report_page.dart';
import 'package:foodapp/pages/userFlow/settings/profile_view_page.dart';
import 'package:foodapp/pages/userFlow/user_notification_page.dart';

class UserReservePage1 extends StatelessWidget {
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
    final currentUser = FirebaseAuth.instance.currentUser;
    List<UserData> users = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('notifications')
        .get();

    querySnapshot.docs.forEach((doc) {
      users.add(UserData(
        catogary: doc['Catogary'],
        meal: doc['Meal'],
        qyt: doc['Qyt'],
        sid: doc['sid'],
      ));
    });

    setState(() {
      this.users = users;
      filteredUsers = users;
    });

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reserve',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserNotificationPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileView()),
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
                            ShopReportPage(userData: filteredUsers[index]),
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
  final String sid;

  UserData({
    required this.catogary,
    required this.meal,
    required this.qyt,
    required this.sid,
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
        child: Container(
          width: 400,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData.catogary, // shop name
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userData.meal, // food reserve time
                      style: TextStyle(
                        fontSize: 7,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Qyt: ${userData.qyt}', // cancel ,completed , cancelled
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

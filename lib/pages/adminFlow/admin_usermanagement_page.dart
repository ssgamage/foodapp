import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/adminFlow/user_details_page.dart';

class UserManagement extends StatelessWidget {
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
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    querySnapshot.docs.forEach((doc) {
      users.add(UserData(
        name: doc['Name'],
        email: doc['Email'],
        profile: doc['profileImageUrl'],
        uid: doc['uid'],
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
            .where(
                (user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
      ),
      body: Column(
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
                            UserDetailsPage(userData: filteredUsers[index]),
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
  final String name;
  final String email;
  final String profile;
  final String uid;

  UserData({
    required this.name,
    required this.email,
    required this.profile,
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

  get profile => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: userData.profile != null
                    ? NetworkImage(userData.profile)
                    : AssetImage('https://via.placeholder.com/150')
                        as ImageProvider,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    userData.email,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

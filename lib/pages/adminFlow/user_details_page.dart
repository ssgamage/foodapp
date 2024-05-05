import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/adminFlow/admin_usermanagement_page.dart';

class UserDetailsPage extends StatelessWidget {
  final UserData userData; // Add this line to receive UserData object

  const UserDetailsPage({required this.userData});

  get profile => null; // Add this constructor

// Function to delete user by UID
  /*Future<void> deleteUserByUid(String uid) async {
    try {
      // Delete the user from Firebase Authentication
      await FirebaseAuth.instance.deleteUser(uid);
      print('User with UID $uid deleted successfully.');
    } catch (e) {
      print('Failed to delete user: $e');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          userData.name, // Display user's name in the app bar
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: CustomColor.textBlack,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: CustomColor.orangeMain,
          ),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context); // Go back to previous screen
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: userData.profile != null
                        ? NetworkImage(userData.profile)
                        : AssetImage('https://via.placeholder.com/150')
                            as ImageProvider,
                  ),
                  SizedBox(height: 10),
                  Text(
                    userData.name,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userData.email,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: CustomColor.textBlack,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.only(left: 5),
              ),
              readOnly: true, // Make it read-only
              initialValue: userData.name, // Set initial value from UserData
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: CustomColor.textBlack,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.only(left: 5),
              ),
              readOnly: true, // Make it read-only
              initialValue: userData.email, // Set initial value from UserData
            ),
          ),
          SizedBox(height: 15),
          // Add other TextFormField widgets for Phone and uid similarly
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add your action for the first button here
                print('Confirm button pressed');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 20),
                foregroundColor: CustomColor.textWhite,
                backgroundColor: CustomColor.orangeMain,
              ),
              child: Text(
                'Warning',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () {
                //deleteUserByUid(userData.uid);
                print('Report button pressed');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 40),
                foregroundColor: CustomColor.textWhite,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Delete',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 175,
            ),
          ],
        ),
      ),
    );
  }
}

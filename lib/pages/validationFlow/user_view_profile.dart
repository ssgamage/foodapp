import 'package:flutter/material.dart';

void main() {
  runApp(user_view_Profile());
}

class user_view_Profile extends StatefulWidget {
  @override
  _user_view_ProfileState createState() => _user_view_ProfileState();
}

class _user_view_ProfileState extends State<user_view_Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  Image.asset(
                    'assets/images/profile_icon/bussiness-man.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        'Cathura Dilshan',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 1),
                      Opacity(
                        opacity: 0.6,
                        child: Text(
                          '@Chathura.ac.lk',
                          style: TextStyle(
                              fontSize: 14.0, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  _buildInfoContainer('Name:', 'chathura'),
                  SizedBox(height: 16),
                  _buildInfoContainer('Email:', 'Dilshan@gmail.com'),
                  SizedBox(height: 16),
                  _buildInfoContainer('Phone:', '0771324586'),
                  SizedBox(height: 16),
                  _buildInfoContainer('Address:', 'No.132/4,pitipana,homagama'),
                  SizedBox(height: 16),
                  _buildInfoContainer('Date of Birth:', '07/03/2002'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContainer(String label, String value) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

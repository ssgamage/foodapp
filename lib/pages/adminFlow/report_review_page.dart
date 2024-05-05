import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';

class ReporReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 218, 218),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 219, 218, 218),
        title: Text(
          'Chathurika Alwis',
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 70),
              width: 350,
              height: 100,
              padding: const EdgeInsets.only(right: 0, left: 10, bottom: 0),
              decoration: BoxDecoration(
                color: CustomColor.textWhite, // Changed to blue color
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    //backgroundImage: AssetImage(
                    //'assets/user_image.png'), // image path
                    radius: 40,
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Report',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: CustomColor.textBlack,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Reason: Poor Food Quality\n(Green House)',
                        style: TextStyle(
                          fontSize: 12,
                          color: CustomColor.textBlack,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your action for the first button here
                    print('Accept button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 40),
                    foregroundColor: CustomColor.textWhite,
                    backgroundColor: CustomColor.orangeMain,
                  ),
                  child: Text(
                    'Accept',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    // Add your action for the second button here
                    print('Reject button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 40),
                    foregroundColor: CustomColor.textWhite,
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Reject',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';

class UserHelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement navigation to previous screen
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OptionButton(
            title: 'How do I reset my password?',
            onPressed: () {},
          ),
          OptionButton(
            title: 'How to cancel reserve',
            onPressed: () {},
          ),
          OptionButton(
            title: 'Updates and Announcements',
            onPressed: () {},
          ),
          OptionButton(
            title: 'How to report  food supplier',
            onPressed: () {},
          ),
          OptionButton(
            title: 'How Can i provide feedback',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  OptionButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          backgroundColor: CustomColor.backgroundOther,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.menu, size: 30.0),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

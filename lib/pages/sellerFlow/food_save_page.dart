import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/food_details_page.dart';

class FoodSavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lunch Not Available',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: CustomColor.orangeMain,
                    ),
                    onPressed: () {
                      // Handle back button press
                      print('Back button pressed');
                    },
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: CustomColor.ellipse,
        ),
        backgroundColor: CustomColor.ellipse,
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodAddPage()),
              );
              //print('Save button pressed');
            },
            child: Image.asset(
              'assets/images/sellerflow/saved1.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}

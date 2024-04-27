import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/food_details_page.dart';

class SetLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.ellipse,
        title: Text(
          'Add Current Location',
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
            print('Back button pressed');
          },
        ),
      ),
      body: Stack(
        children: [
          // Your other widgets for the body content go here

          // Positioned widget to place the button at the bottom center
          Positioned(
            bottom: 80.0, // Adjust bottom margin as needed
            left: MediaQuery.of(context).size.width / 2 -
                75, // Center horizontally
            child: SizedBox(
              width: 150,
              height: 50,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodAddPage()),
                  );
                  print('Location set successfully');
                },
                label: Text(
                  'Set Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: CustomColor.textWhite,
                  ),
                ),
                backgroundColor: CustomColor.orangeMain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

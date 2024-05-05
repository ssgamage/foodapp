import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/food_details_page.dart';
import 'package:foodapp/pages/sellerFlow/food_selection_others.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SellerFoodSelectionPage extends StatelessWidget {
  const SellerFoodSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.textWhite,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: CustomColor.orangeSecondary,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Step 1/3',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: BodyContent(),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.textWhite,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // Navigate to SellerFoodSelectionPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FoodAddPage(selectedLocation: LatLng(0, 0))),
                    );
                  },
                  child: _buildContainerWithImageAndText(
                    "assets/images/userflow/homepage/ho1.jpg",
                    'Rice and Curry',
                  ),
                ),
                SizedBox(width: 16),
                _buildContainerWithImageAndText(
                  "assets/images/userflow/homepage/ho2.jpeg",
                  'Fried Rice',
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildContainerWithImageAndText(
                  "assets/images/userflow/homepage/ho3.jpeg",
                  'Noodles',
                ),
                SizedBox(width: 16),
                _buildContainerWithImageAndText(
                  "assets/images/userflow/homepage/ho4.jpeg",
                  'String Hoppers',
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildContainerWithImageAndText(
                  "assets/images/userflow/homepage/ho5.jpg",
                  'Hoppers',
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // Navigate to SellerFoodSelectionPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodSelectionOtherPage()),
                    );
                  },
                  child: _buildContainerWithImageAndText(
                    "assets/images/userflow/homepage/ho6.jpg",
                    'Others',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerWithImageAndText(String imagePath, String text) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: CustomColor.textWhite,
        border: Border.all(color: CustomColor.orangeMain, width: 3.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomColor.textBlack,
            ),
          ),
        ],
      ),
    );
  }
}

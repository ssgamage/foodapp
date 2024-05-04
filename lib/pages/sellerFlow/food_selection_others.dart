import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';

class FoodSelectionOtherPage extends StatelessWidget {
  const FoodSelectionOtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColor.textWhite,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: CustomColor.orangeMain,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Others Step 1/3',
          style: TextStyle(
            color: CustomColor.textBlack,
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
            // First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildContainerWithImageAndText(
                  "assets/images/userflow/homepage/ot1.png",
                  'Fruit Salad',
                ),
                SizedBox(width: 16),
                _buildContainerWithImageAndText(
                  "assets/images/userflow/homepage/ot2.png",
                  'Vatalappan',
                ),
              ],
            ),
            SizedBox(height: 16),
            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildContainerWithImageAndText(
                  "assets/images/userflow/homepage/ot3.png",
                  'Puddins',
                ),
                SizedBox(width: 16),
                _buildContainerWithImageAndText(
                  "assets/images/userflow/homepage/ot4.png",
                  'Cakes',
                ),
              ],
            ),
            SizedBox(height: 16),
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
        border: Border.all(color: CustomColor.orangeSecondary, width: 3.0),
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

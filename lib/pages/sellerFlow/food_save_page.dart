import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/sellerFlow/food_add_view.dart';

class FoodSavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodAddSavePage()),
                      );
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FoodAddSavePage()),
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

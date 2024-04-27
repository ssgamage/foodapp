import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/userFlow/homeFlow/food_selection_page.dart';
import 'package:foodapp/pages/userFlow/homeFlow/not_available_page.dart';
import 'package:foodapp/pages/userFlow/user_notification_page.dart';

class UserMainHomePage1 extends StatelessWidget {
  const UserMainHomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EasyEats',
          style: TextStyle(
            fontFamily: 'Righteous',
            fontWeight: FontWeight.w800, // Semi-bold
            fontSize: 28,
            color: CustomColor.orangeSecondary,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, -0.10),
              end: Alignment(-1, 0.1),
              colors: [
                CustomColor.textWhite,
                CustomColor.notificationSecondary
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserNotificationPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Add profile icon logic here
            },
          ),
        ],
      ),
      body: Container(
        width: 432,
        height: 550,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: const Color(0xFFFCFBF9)),
        child: Stack(
          children: [
            Positioned(
              left: -1,
              top: -47,
              child: Container(
                width: 447,
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, -0.10),
                    end: Alignment(-1, 0.1),
                    colors: [
                      CustomColor.orangeMain,
                      CustomColor.orangeSecondary
                    ],
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 10,
              child: SizedBox(
                width: 210,
                child: Text(
                  'Welcome Chathurika Alwis',
                  style: const TextStyle(
                    color: CustomColor.textBlack,
                    fontSize: 16,
                    fontFamily: 'Roboto Slab',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 60,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Text(
                  //'Where Culinary Dreams Meet Effortless Reservations. Relish in Seamless Booking, \nEasy Access, and Secure Dining  All at Your Fingertips!',
                  'Empower Culinary Journeys with Streamlined Operations, \nUnmatched Efficiency, and a Feast of Opportunities. Elevate Your Business with Our Seamless Reservation Solutions!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: CustomColor.textWhite,
                    fontSize: 16,
                    fontFamily: 'Signika',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 210,
              top: 50,
              child: Container(
                width: 190,
                height: 163,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/userflow/homepage/c111.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Choose your mealtime adventure!',
                        style: TextStyle(
                          fontSize: 20.5,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.textBlack,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:
                          238, // Adjust  height of the horizontal scrolling bar
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to SellerFoodSelectionPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UserFoodSelectionPage()),
                              );
                            },
                            child: buildMealCard(
                                "assets/images/userflow/homepage/d1.png",
                                "Breakfast"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotAvailablePage()),
                              );
                            },
                            child: buildMealCard(
                                "assets/images/userflow/homepage/l1.jpg",
                                "Lunch"),
                          ),
                          buildMealCard(
                              "assets/images/userflow/homepage/b11.jpg",
                              "Dinner"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMealCard(String imagePath, String mealName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 110),
            Text(
              mealName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: CustomColor.textWhite,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/userFlow/homeFlow/main_home_page.dart';

class NotAvailablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lunch Not Available',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                      Navigator.pop(context);
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
                MaterialPageRoute(builder: (context) => UserMainHomePage()),
              );
            },
            child: Image.asset(
              'assets/images/sellerflow/oops1.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}

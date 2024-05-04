import 'package:flutter/material.dart';
import 'package:foodapp/pages/userFlow/homeFlow/main_home_page.dart';

class BoldText extends StatelessWidget {
  final String text;

  const BoldText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class UserNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldText('Notification'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserMainHomePage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(252, 242, 243, 244),
      body: MyWidgets(),
    );
  }
}

class MyWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return ListTile(
            title: BoldText('New'),
          );
        } else {
          String time;
          String name;
          String message;
          Color cardColor;
          double cardWidth = 150;
          double cardHeight = 90;
          switch (index) {
            case 1:
              time = '12.32 PM';
              name = 'Green House';
              message = 'Your cancellation request has been successfully.';
              cardColor = Color.fromARGB(255, 240, 194, 120);
              break;
            case 2:
              time = '12.05 PM';
              name = 'EasyEats';
              message = 'Hungry? Order now and enjoy savings!.';
              cardColor = Color.fromARGB(235, 240, 214, 165);
              break;
            case 3:
              time = '10.32 AM';
              name = 'Green house';
              message = 'Your Cancellation request accepted successfully.';
              cardColor = Color.fromARGB(255, 230, 233, 235);
              break;
            case 4:
              time = '9.06 AM';
              name = 'EasyEats';
              message = 'Hungry? Order now and enjoy savings!';
              cardColor = Color.fromARGB(255, 230, 233, 235);
              break;
            case 5:
              time = '9.45 AM';
              message = 'Your Cancellation request accepted.';
              name = 'Gammedda';
              cardColor = Color.fromARGB(255, 230, 233, 235);
              break;
            default:
              time = '';
              name = '';
              message = '';
              cardColor = Color.fromARGB(255, 230, 233, 235);
          }
          return GestureDetector(
            onTap: () {
              // Navigate to a different page based on the tapped card
              switch (index) {
                case 1:
                  //
                  break;
                default:
                  break;
              }
            },
            child: Container(
              height: cardHeight,
              width: cardWidth,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 84, 83, 83),
                  width: 0.6,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Card(
                color: cardColor,
                child: ListTile(
                  title: BoldText(name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(message),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(time),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodapp/pages/sellerFlow/seller_main_home.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldText('Notification'), // Make the app bar title bold
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SellerMainHomePage()),
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
            title: BoldText('New'), // Make the "New" text bold
          );
        } else {
          String time;
          String name;
          String message;
          switch (index) {
            case 1:
              time = '8.32 PM';
              name = 'Chathurika Alwis';
              message = 'Just Reserved your food to Chathurika Alwis.';
              break;
            case 2:
              time = '7.00 PM';
              name = 'NN Tennakoon';
              message = 'Your food is reserved Successfully.';
              break;
            case 3:
              time = '10.32 PM';
              name = 'WSJ Shashini';
              message = 'Your food Order is Canceled.';
              break;
            case 4:
              time = '12.06 PM';
              name = 'HDM Botheju';
              message = 'Your food is reserved Successfully.';
              break;
            case 5:
              time = '12.45 PM';
              name = 'SK Dilaz';
              message = 'Your food is reserved Successfully.';
              break;
            default:
              time = '';
              name = '';
              message = '';
          }
          Card card;
          if (index == 1) {
            card = Card(
              color: Color.fromARGB(255, 240, 194, 120),
              child: ListTile(
                title: BoldText(name), // Make the name text bold
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
            );
          } else if (index == 2) {
            card = Card(
              color: Color.fromARGB(235, 240, 214, 165),
              child: ListTile(
                title: BoldText(name), // Make the name text bold
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
            );
          } else {
            card = Card(
              color: Color.fromARGB(255, 230, 233, 235),
              child: ListTile(
                title: BoldText(name), // Make the name text bold
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
            );
          }
          return Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.all(5),
            child: card,
          );
        }
      },
    );
  }
}

class BoldText extends StatelessWidget {
  final String text;

  BoldText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

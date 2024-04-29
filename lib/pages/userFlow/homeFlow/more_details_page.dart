import 'package:flutter/material.dart';
import 'package:foodapp/pages/userFlow/homeFlow/location_view_page.dart';
import 'package:foodapp/pages/userFlow/user_reservation_page.dart';

class ShopMoreDetails extends StatefulWidget {
  @override
  _ShopMoreDetailsState createState() => _ShopMoreDetailsState();
}

class _ShopMoreDetailsState extends State<ShopMoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle your arrow button press here
            // For example, you can navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        title: Text('Breakfast Step 3/3'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Restaurant View',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width *
                0.6, // Adjust width as needed
            height: 250, // Adjust height as needed
            child: Image.asset(
              'assets/images/userflow/foodselect/ds1.png',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              'Green House',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text:
                        'Discover diverse cuisines at our welcoming restaurant app, perfect for everyone!\n',
                  ),
                  TextSpan(
                    text: 'Contact Number - ',
                  ),
                  TextSpan(
                    text: '077-742111  /  011-123333',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Change the border color here
              ),
              color: Colors.grey[200], // Set the background color here
            ),
            child: Column(
              children: [
                Text(
                  'Hey, Today available curries\nDhal curry\nPolos curry\nBeans curry\nChicken curry\nBrinjal eggplant moju curry',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold, // Bold the text
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs 200',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red, // Change text color to red
                        fontWeight: FontWeight.bold, // Bold the text
                      ),
                    ),
                    Text(
                      'Quantity: 20',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold, // Bold the text
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Handle the addition action
                        },
                      ),
                      Text(
                        'Add Qty',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          // Handle the subtraction action
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                      height:
                          2), // Add some space between the buttons and the new row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationView()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text('Location'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // UserReservePage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserReservePage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text('Reserve'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

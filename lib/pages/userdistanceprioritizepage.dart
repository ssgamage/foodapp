import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 253, 238, 214),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.orange,
            onPressed: () {
              // Add your back button logic here
            },
          ),
          title: const Text('Step 2/3'),
        ),
        body: Container(
          color: Color.fromARGB(255, 253, 238, 214),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 15),
                  const Text(
                    'Rice and Curry',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Signika',
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 180,
                        height: 250,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/ds1.png', //shop profile image display in this here
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'Price: \RS120', //food price
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '10% OFF', //food Dicount
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Green House', //food shop name
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Distance: 2 miles', //display distance
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Quantity: 22', // Qty
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 180,
                        height: 250,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/ds2.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'Price: RS230',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '10% OFF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Gammedda',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Distance: 2 miles',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Quantity: 12 ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 180,
                        height: 250,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/ds3.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'Price: \RS150',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '10% OFF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Rivirasa Bojun',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Distance: 2 miles',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Quantity: 22 ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 180,
                        height: 250,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/ds4.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'Price: \RS 200',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '10% OFF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'KND Food',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Distance: 2 miles',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Quantity: 15',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 180,
                        height: 250,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/ds5.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'Price: \RS180',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '10% OFF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Awanhala',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Distance: 2 miles',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Quantity: 20',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 180,
                        height: 250,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/ds6.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'Price: RS 150',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '10% OFF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            const Text(
                              'Nimansala',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Distance: 500 m',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Quantity: 10 ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

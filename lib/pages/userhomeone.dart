import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Corrected constructor definition

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(
              255, 238, 238, 238), // Set AppBar background color
          leading: IconButton(
            // Custom back button
            icon: const Icon(Icons.arrow_back),
            color: Colors.orange, // Set icon color
            onPressed: () {
              // Handle back button press
            },
          ),
          title: const Text(
            // Title with step indication
            'Step 1/3',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0)), // Set title text color
          ),
        ),
        body: Container(
          color: const Color.fromARGB(
              255, 238, 238, 238), // Set the background color here
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // First Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildContainerWithImageAndText(
                      "assets/images/ho1.jpg",
                      'Rice and Curry',
                    ),
                    const SizedBox(width: 16),
                    _buildContainerWithImageAndText(
                      "assets/images/ho2.jpeg",
                      'Fried Rice',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Second Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildContainerWithImageAndText(
                      "assets/images/ho3.jpeg",
                      'Noodles',
                    ),
                    const SizedBox(width: 16),
                    _buildContainerWithImageAndText(
                      "assets/images/ho4.jpeg",
                      'String Hoppers',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Third Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildContainerWithImageAndText(
                      "assets/images/ho5.jpg",
                      'Hoppers',
                    ),
                    const SizedBox(width: 16),
                    _buildContainerWithImageAndText(
                      "assets/images/ho6.jpg",
                      'Others',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainerWithImageAndText(String imagePath, String text) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 239, 221, 200), // Set the background color for each container
        border: Border.all(color: Colors.orange, width: 3.0),
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
          const SizedBox(height: 15),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}

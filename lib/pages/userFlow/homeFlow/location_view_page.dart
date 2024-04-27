import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.orange,
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text(
          'View location',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/userflow/loc.jpg"), //yo sonal  this map using API part edite in here
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Your content here
            ],
          ),
        ),
      ),
    );
  }
}

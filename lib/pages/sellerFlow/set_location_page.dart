import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetLocationPage extends StatefulWidget {
  @override
  _SetLocationPageState createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  late LatLng _selectedLocation;

  @override
  void initState() {
    super.initState();
    // Set initial location (e.g., center of the map)
    _selectedLocation = LatLng(37.42796133580664, -122.085749655962);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.ellipse,
        title: Text(
          'Add Your Location',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: CustomColor.textBlack,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: CustomColor.orangeMain,
          ),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Map widget
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation,
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: MarkerId('selectedLocation'),
                position: _selectedLocation,
                draggable: true,
                onDragEnd: (LatLng newPosition) {
                  setState(() {
                    _selectedLocation = newPosition;
                  });
                },
              ),
            },
          ),
          // Positioned widget to place the button at the bottom center
          Positioned(
            bottom: 80.0, // Adjust bottom margin as needed
            left: MediaQuery.of(context).size.width / 2 -
                75, // Center horizontally
            child: SizedBox(
              width: 150,
              height: 50,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pop(context, _selectedLocation);
                },
                label: Text(
                  'Set Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: CustomColor.textWhite,
                  ),
                ),
                backgroundColor: CustomColor.orangeMain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

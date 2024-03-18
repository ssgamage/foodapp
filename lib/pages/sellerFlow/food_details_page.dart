import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Your Foods',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.ellipse,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // Handle back button press
                      print('Back button pressed');
                    },
                  ),
                  Text(
                    'Add Your Foods',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: CustomColor.textBlack,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text(
                  'Add Your Meals Menu',
                  // Text below the title
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: CustomColor.textBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sellerflow/ellipse7.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Meal image
                  Container(
                    width: 100,
                    height: 25.0,
                    child: Text('image'),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColor.textBlack),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(height: 10.0),

                  //elevate 01
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your action for the first button here
                        print('Update Meal Image');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                        foregroundColor: CustomColor.textWhite,
                        backgroundColor: CustomColor.orangeMain,
                      ),
                      child: Text(
                        'Update Meal Image',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Add Qty and Add Price TextFormFields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: ' Add Price',
                              labelStyle: TextStyle(
                                color: CustomColor.textBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.only(left: 5),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: ' - Add Qty + ',
                              labelStyle: TextStyle(
                                color: CustomColor.textBlack,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.only(left: 5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Add discount text
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 210),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: ' Add Discount  %',
                        labelStyle: TextStyle(
                          color: CustomColor.textBlack,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.only(left: 5),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Add meal name text
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 210),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: ' Meal Name',
                        labelStyle: TextStyle(
                          color: CustomColor.textBlack,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.only(left: 5),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Add description text
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: ' Add Description',
                        labelStyle: TextStyle(
                          color: CustomColor.textBlack,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.only(
                            right: 0, left: 5, top: 50, bottom: 50),
                      ),
                    ),
                  ),

                  SizedBox(height: 5),

                  //elevate 02
                  ElevatedButton(
                    onPressed: () {
                      // Add your action for the first button here
                      print('Add Location pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(250, 20),
                      foregroundColor: CustomColor.textWhite,
                      backgroundColor: CustomColor.backgroundSecondary,
                    ),
                    child: Text(
                      'Add Current Location',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //elevate 03
                  ElevatedButton(
                    onPressed: () {
                      // Add your action for the second button here
                      print('Save button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 40),
                      foregroundColor: CustomColor.textWhite,
                      backgroundColor: CustomColor.orangeMain,
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodapp/pages/userFlow/user_notification_page.dart';

class ReportOptionsPage extends StatefulWidget {
  @override
  _ReportOptionsPageState createState() => _ReportOptionsPageState();
}

class _ReportOptionsPageState extends State<ReportOptionsPage> {
  List<String> _selectedReasons = [];
  TextEditingController _otherReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Report',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 213, 149),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.orange,
                    width: 2.0,
                  ),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select reasons:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        _buildCheckbox(
                            title: 'Poor Food Quality',
                            value: 'poor_food_quality'),
                        _buildCheckbox(
                            title: 'Health and Safety Concerns',
                            value: 'health_and_safety_concerns'),
                        _buildCheckbox(
                            title: 'Wrong Charges', value: 'wrong_charges'),
                        _buildCheckbox(
                            title: 'False Advertising',
                            value: 'false_advertising'),
                        _buildCheckbox(
                            title: 'Item Unavailability',
                            value: 'item_unavailability'),
                        _buildCheckbox(
                            title: 'Unsatisfactory Packaging',
                            value: 'unsatisfactory_packaging'),
                        _buildCheckbox(
                            title: 'Repeated Menu Price Changes',
                            value: 'repeated_menu_price_changes'),
                        _buildCheckbox(
                            title: 'Poor Customer Service Response',
                            value: 'poor_customer_service_response'),
                        _buildCheckbox(
                            title: 'Other Reasons', value: 'other_reasons'),
                        SizedBox(height: 10),
                        _buildOtherReasonTextField(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 200, // Adjust the width here
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserNotificationPage()),
                    );
                    print(_selectedReasons);
                    print(_otherReasonController.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.orange), // Set button color to orange
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white), // Set text color to white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox({required String title, required String value}) {
    return Row(
      children: [
        Checkbox(
          value: _selectedReasons.contains(value),
          onChanged: (checked) {
            setState(() {
              if (checked!) {
                _selectedReasons.add(value);
              } else {
                _selectedReasons.remove(value);
              }
            });
          },
        ),
        Text(title),
      ],
    );
  }

  Widget _buildOtherReasonTextField() {
    return TextFormField(
      controller: _otherReasonController,
      decoration: InputDecoration(
        labelText: 'Other Reason',
        border: OutlineInputBorder(),
        filled: true, // Set filled to true
        fillColor: Colors.white, // Set fillColor to white
      ),
    );
  }

  @override
  void dispose() {
    _otherReasonController.dispose();
    super.dispose();
  }
}

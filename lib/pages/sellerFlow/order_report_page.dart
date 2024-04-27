import 'package:flutter/material.dart';
import 'package:foodapp/pages/sellerFlow/reserved_page.dart';

class OrderReportPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        title: BoldText('Report'), // Make the app bar title bold
      ),
      backgroundColor: Color.fromARGB(255, 242, 240, 240),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 234, 122, 10), width: 2),
                  color: Color.fromARGB(255, 242, 220, 199),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Add your reason...',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a reason';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReservedPage()),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 234, 122, 10)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 100, vertical: 5)),
                ),
                child: Text('Submit', style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
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

import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/validationFlowImg/ellipse3.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 170),
                  child: Image.asset(
                      'assets/images/validationFlowImg/easyeats1.png',
                      width: 220),
                ),
              ),
              Expanded(
                flex: 8, //main sector
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Enter code',
                          style: TextStyle(
                            fontSize: 20,
                            color: CustomColor.textBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Add your form here
                        VerificationPageCode(),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 0),
                    child: GestureDetector(
                      onTap: () {},
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have account?",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' create account',
                              style: TextStyle(
                                fontSize: 16,
                                color: CustomColor.orangeMain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class VerificationPageCode extends StatefulWidget {
  @override
  _VerificationPageCodeState createState() => _VerificationPageCodeState();
}

class _VerificationPageCodeState extends State<VerificationPageCode> {
  final GlobalKey<FormState> _forvKey =
      GlobalKey<FormState>(); // Fixed typo in the key name

  int? _code;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _forvKey, // Added key to the Form widget
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a verification code to continue';
                } else if (!RegExp(r'^\d{4}$').hasMatch(value)) {
                  return 'Please enter a valid code';
                }
                return null;
              },
              onSaved: (value) {
                _code = int.parse(value!); // Fixed parsing issue here
              },
            ),
          ),
          const SizedBox(height: 20),
          //Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: ElevatedButton(
              onPressed: () {
                _submitForm1();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: CustomColor.textWhite,
                backgroundColor: CustomColor.orangeMain,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Log in',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm1() {
    if (_forvKey.currentState!.validate()) {
      _forvKey.currentState!.save();
      // Implement logic to send code and navigate
    }
  }
}

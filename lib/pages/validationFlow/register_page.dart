import 'dart:async'; //

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/validationFlow/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<RegisterPage> {
  String? valueChoose;
  List<String> listItem = ["User", "Seller", "Admin"];
  bool _obscurePassword = true; // For password visibility
  bool _obscureConfirmPassword = true; // For confirm password visibility

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordcomfController = TextEditingController();
  //final _acctupeController = TextEditingController();
  String? selectedAccountType;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _passwordcomfController.dispose();
    selectedAccountType;
    //_acctupeController.dispose();
    super.dispose();
  }

  Future signUpU(BuildContext context) async {
    try {
      if (_passwordController.text.trim().length < 6) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Password should be at least 6 characters long!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        return;
      }
      if (passwordConfirmed()) {
        // Create user using Firebase Auth
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim());

        // Check selected account type
        if (selectedAccountType == 'User') {
          addUserDetails(
            _nameController.text.trim(),
            _emailController.text.trim(),
            _phoneController.text.trim(),
            selectedAccountType!,
            userCredential.user!.uid, // Pass UID to identify user document
          );
        } else if (selectedAccountType == 'Admin') {
          addAdminDetails(
            _nameController.text.trim(),
            _emailController.text.trim(),
            _phoneController.text.trim(),
            selectedAccountType!,
            userCredential.user!.uid, // Pass UID to identify admin document
          );
        } else {
          addSellerDetails(
            _nameController.text.trim(),
            _emailController.text.trim(),
            _phoneController.text.trim(),
            selectedAccountType!,
            userCredential.user!.uid, // Pass UID to identify seller document
          );
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(title: "Login"),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Passwords do not match! Please check again.."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Handle registration errors
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Future addUserDetails(
      String name, String email, String phone, String role, String uid) async {
    // Add user details to 'users' collection
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'Name': name,
      'Email': email,
      'Phone': phone,
      'role': role,
      'uid': uid,
    });
  }

  Future addSellerDetails(
      String name, String email, String phone, String role, String uid) async {
    // Add seller details to 'sellers' collection
    await FirebaseFirestore.instance.collection('sellers').doc(uid).set({
      'Name': name,
      'Email': email,
      'Phone': phone,
      'role': role,
      'uid': uid,
    });
  }

  Future addAdminDetails(
      String name, String email, String phone, String role, String uid) async {
    // Add admin details to 'admin' collection
    await FirebaseFirestore.instance.collection('admin').doc(uid).set({
      'Name': name,
      'Email': email,
      'Phone': phone,
      'role': role,
      'uid': uid,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _passwordcomfController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/validationFlowImg/ellipse3.png',
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/validationFlowImg/easyeats1.png',
                    width: 200,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Create your new account',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0.5, // reduced border height
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0.5, // reduced border height
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0.5, // reduced border height
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text('Account type'),
                            value: valueChoose,
                            onChanged: (String? newValue) {
                              setState(() {
                                valueChoose = newValue;
                                selectedAccountType = newValue;
                              });
                            },
                            items: listItem.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0.5, // reduced border height
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordcomfController,
                          obscureText: _obscureConfirmPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0.5, // reduced border height
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: [
                              TextSpan(
                                text: 'By signing up you agree to our ',
                              ),
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                  color: CustomColor.orangeMain,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle "Terms & Conditions" link tap here
                                  },
                              ),
                              TextSpan(
                                text: ' and ',
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: CustomColor.orangeMain,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle "Privacy Policy" link tap here
                                  },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        ElevatedButton(
                          onPressed: () {
                            signUpU(context);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: CustomColor.textWhite,
                            backgroundColor: CustomColor.orangeMain,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            minimumSize: const Size(double.infinity, 40),
                          ),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    'OR',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/validationFlowImg/googlelogo1.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/validationFlowImg/facebooklogo1.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/validationFlowImg/applelogo1.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(
                                  title: "",
                                )),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an Account?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' Log In',
                            style: TextStyle(
                              fontSize: 16,
                              color: CustomColor.orangeMain,
                            ),
                          ),
                        ],
                      ),
                    ),
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

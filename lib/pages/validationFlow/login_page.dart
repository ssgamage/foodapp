import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/adminFlow/bottomnavigationbar.dart';
import 'package:foodapp/pages/sellerFlow/seller_main_home.dart';
import 'package:foodapp/pages/userFlow/homeFlow/main_home_page.dart';
import 'package:foodapp/pages/validationFlow/firebase_auth_implimentation/firebase_auth_services.dart';
import 'package:foodapp/pages/validationFlow/forgot_pw.dart';
import 'package:foodapp/pages/validationFlow/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool _obscureText = true;
  bool _obscurePassword = true; // For password visibility
  bool _obscureConfirmPassword = true;

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                flex: 9,
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome back',
                          style: TextStyle(
                            fontSize: 30,
                            color: CustomColor.textBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Login to your account',
                          style: TextStyle(
                            fontSize: 17,
                            color: CustomColor.textBlack,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Add your form here
                        Form(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: const Icon(Icons.email),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: TextFormField(
                                  obscureText: _obscurePassword,
                                  controller: _passwordController,
                                  //obscureText: true,
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
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 1),
                              //remember me section
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: rememberMe,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                rememberMe = value!;
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => const BorderSide(
                                                  width: 1.0,
                                                  color: CustomColor.textBlack),
                                            ),
                                            fillColor: MaterialStateProperty
                                                .resolveWith<Color?>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(
                                                    MaterialState.selected)) {
                                                  return CustomColor
                                                      .orangeMain; // Checked color
                                                } else if (states.contains(
                                                    MaterialState.hovered)) {
                                                  return CustomColor.textBlack
                                                      .withOpacity(
                                                          0.04); // Hovered color
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          const Text(
                                            'Remember me',
                                            style: TextStyle(
                                                color: CustomColor.textBlack),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPasswordPage()),
                                        );
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: CustomColor.orangeMain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              //Button
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _signIn();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: CustomColor.textWhite,
                                    backgroundColor: CustomColor.orangeMain,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                  ),
                                  child: const Text(
                                    'Log in',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        // or and create acc section
                        const Text(
                          'OR',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                'assets/images/validationFlowImg/googlelogo1.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                'assets/images/validationFlowImg/facebooklogo1.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                'assets/images/validationFlowImg/applelogo1.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
                            },
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
                      ],
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

  /*void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Check the user's custom claims to determine the role
        Map<String, dynamic> customClaims =
            (await user.getIdTokenResult(true)).claims ?? {};

        String? role = customClaims['role'];

        if (role == 'Admin') {
          // Navigate to admin dashboard
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminDashboardPage()),
          );
        } else if (role == 'Seller') {
          // Navigate to seller dashboard
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SellerDashboardPage()),
          );
        } else {
          // Navigate to user dashboard
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserDashboardPage()),
          );
        }
      }
    } catch (e) {
      print("Error occurred: $e");
      // Handle error, display error message, etc.
    }
  }*/

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Check each personal collection for the user's UID
        List<String> collectionNames = ['admin', 'sellers', 'users'];
        String? uid;
        String?
            collectionName; // Declaring collectionName variable outside the loop

        for (String name in collectionNames) {
          DocumentSnapshot userDoc = await FirebaseFirestore.instance
              .collection(name)
              .doc(user.uid)
              .get();

          if (userDoc.exists) {
            uid = user.uid;
            collectionName =
                name; // Assigning the current collection name to collectionName variable//
            break;
          }
        }

        if (uid != null && collectionName != null) {
          // Get user document using found UID
          DocumentSnapshot userDoc = await FirebaseFirestore.instance
              .collection(collectionName)
              .doc(uid)
              .get();

          // Retrieve gender from Firestore document
          String? role = userDoc['role'];

          if (role == 'Admin') {
            // Navigate to admin dashboard
            //MaterialPageRoute(builder: (context) => AdminDashboardPage()),

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => NavigationPage()),
            );
          } else if (role == 'Seller') {
            // Navigate to seller dashboard
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SellerMainHomePage()),
            );
          } else {
            // Navigate to user dashboard
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => UserMainHomePage()),
            );
          }
        } else {
          // Handle case where user document doesn't exist
          print('User document not found');
        }
      }
    } catch (e) {
      print("Error occurred: $e");
      // Handle error, display error message, etc.
    }
  }
} //end

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoormedicalstore/screen/forgot_password_screen.dart';
import 'package:hoormedicalstore/screen/product_overview_screen.dart';
import 'package:hoormedicalstore/screen/signup_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController useremailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 400,
                  child: Lottie.asset(
                      'assets/images/Animation - 1741099749178.json'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: useremailController,
                decoration: InputDecoration(
                    hintText: 'E-mail',
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: userpasswordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.deepPurple))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                var useremail = useremailController.text.trim();
                var userpassword = userpasswordController.text.trim();
                try {
                  final User? userlogin = (await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: useremail, password: userpassword))
                      .user;
                  if (userlogin != null) {
                    Get.to(() => ProductOverviewScreen());
                  } else {
                    print('Check Email and Password');
                  }
                } on FirebaseAuthException catch (e) {
                  print('error: $e');
                }
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(ForgotPasswordScreen.routeName);
                },
                child: Text('Forgot Password')),
            SizedBox(
              height: 100,
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(SignupScreen.routeName),
                child: Container(
                  height: 60,
                  color: Colors.deepPurple,
                  child: Center(
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

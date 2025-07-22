import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoormedicalstore/Auth/signup_auth.dart';
import 'package:hoormedicalstore/screen/login_screen.dart';

import 'package:lottie/lottie.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/SignUpScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController UserNameController = TextEditingController();
  TextEditingController UserEMailController = TextEditingController();
  TextEditingController UserPasswordController = TextEditingController();

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
                controller: UserNameController,
                decoration: InputDecoration(
                    hintText: 'User Name',
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
                controller: UserEMailController,
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
                controller: UserPasswordController,
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
                var UserName = UserNameController.text.trim();
                var UserEMail = UserEMailController.text.trim();
                var UserPassword = UserPasswordController.text.trim();

                await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: UserEMail, password: UserPassword)
                    .then((value) => {
                          print("User Created"),
                          SignupAuth(
                            UserName,
                            UserEMail,
                          )
                        });
              },
              child: Text(
                'SignUp',
                style: TextStyle(color: Colors.white),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            ),
            SizedBox(
              height: 80,
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => LoginScreen());
                },
                child: Container(
                  height: 60,
                  color: Colors.deepPurple,
                  child: Center(
                    child: Text(
                      'Login',
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

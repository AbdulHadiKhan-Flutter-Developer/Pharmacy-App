import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoormedicalstore/screen/login_screen.dart';

import 'package:lottie/lottie.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgotPasswordScreen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgotemailController = TextEditingController();
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
                controller: forgotemailController,
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
            ElevatedButton(
              onPressed: () async {
                var forgotemail = forgotemailController.text.trim();
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: forgotemail)
                      .then((value) => {Get.off(() => LoginScreen())});
                } on FirebaseAuthException catch (e) {
                  print('Error: $e');
                }
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.white),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            ),
            SizedBox(
              height: 210,
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName),
                child: Container(
                  height: 60,
                  color: Colors.deepPurple,
                  child: Center(
                    child: Text(
                      'Cancel',
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

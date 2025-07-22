import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:hoormedicalstore/screen/product_overview_screen.dart';

SignupAuth(
  String UserName,
  String UserEMail,
) async {
  User? currentuser = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance.collection("User").doc().set({
      'UserName': UserName,
      'UserEmail': UserEMail,
      'CreatedAt': DateTime.now(),
      'UserId': currentuser!.uid,
    }).then((value) {
      Get.to(() => ProductOverviewScreen());
    });
    print("data Stored");
  } on FirebaseAuthException catch (e) {
    print('Error: $e');
  }
}

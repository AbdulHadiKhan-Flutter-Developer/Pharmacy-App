import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hoormedicalstore/provider/cart_provider.dart';
import 'package:hoormedicalstore/provider/checkout_provider.dart';
import 'package:hoormedicalstore/provider/order_provider.dart';

import 'package:hoormedicalstore/provider/product_provider.dart';
import 'package:hoormedicalstore/provider/profile_provider.dart';

import 'package:hoormedicalstore/screen/cart_screen.dart';
import 'package:hoormedicalstore/screen/checkout_screen.dart';
import 'package:hoormedicalstore/screen/forgot_password_screen.dart';
import 'package:hoormedicalstore/screen/login_screen.dart';

import 'package:hoormedicalstore/screen/order_screen.dart';

import 'package:hoormedicalstore/screen/product_detail_screen.dart';
import 'package:hoormedicalstore/screen/product_overview_screen.dart';
import 'package:hoormedicalstore/screen/profile.dart';
import 'package:hoormedicalstore/screen/profile_edited_screen.dart';
import 'package:hoormedicalstore/screen/settings.dart';
import 'package:hoormedicalstore/screen/signup_screen.dart';

import 'package:hoormedicalstore/screen/terms_condition.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HoorMedicalStore());
}

class HoorMedicalStore extends StatefulWidget {
  @override
  State<HoorMedicalStore> createState() => _HoorMedicalStoreState();
}

class _HoorMedicalStoreState extends State<HoorMedicalStore> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => CheckoutProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        
            
        // ChangeNotifierProvider(create: (context) => OrderProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: user != null ? ProductOverviewScreen() : SignupScreen(),
        routes: {
          ProductOverviewScreen.routeName: (ctx) => ProductOverviewScreen(),
          Profile.routeName: (ctx) => Consumer<ProfileProvider>(
                builder: (ctx, profileProvider, child) {
                  return Profile(profileProvider.items[0]);
                },
              ),
          Settings.routeName: (ctx) => Settings(),
          TermsCondition.routeName: (ctx) => TermsCondition(),
          ProfileEditedScreen.routeName: (ctx) => ProfileEditedScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),

          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignupScreen.routeName: (ctx) => SignupScreen(),
          ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
          // OrderScreen.routeName: (ctx) => OrderScreen(),
        },
      ),
    );
  }
}

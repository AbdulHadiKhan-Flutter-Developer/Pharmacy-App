import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoormedicalstore/provider/order_provider.dart';
import 'package:hoormedicalstore/screen/adminpanel/Home.dart';
import 'package:hoormedicalstore/screen/adminpanel/uploaded_products.dart';
import 'package:hoormedicalstore/screen/adminpanel/user_data.dart';
import 'package:hoormedicalstore/screen/login_screen.dart';
import 'package:hoormedicalstore/screen/order_screen.dart';

import 'package:provider/provider.dart';

class AdminAppDrawer extends StatelessWidget {
  static const routeName = '/AppDrawerScreen';

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context, listen: false);
    return Drawer(
      child: Column(
        children: [
          AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.deepPurple,
            title: Text(
              'Hello!',
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
              iconColor: Colors.deepPurple,
              trailing: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () => Get.off(() => Home())),
          Divider(),
          ListTile(
              iconColor: Colors.deepPurple,
              trailing: Icon(Icons.person),
              title: Text(
                'Users',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () => Get.to(() => UserData())),
          Divider(),
          ListTile(
            iconColor: Colors.deepPurple,
            trailing: Badge(
                label: Text(order.itemcount.toString()),
                child: Icon(Icons.payment)),
            title: Text(
              'Order',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
              iconColor: Colors.deepPurple,
              trailing: Icon(Icons.shopping_cart),
              title: Text(
                'Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () => Get.to(() => UploadedProducts())),
          Divider(),
          ListTile(
              iconColor: Colors.deepPurple,
              trailing: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Get.off(() => LoginScreen());
              }),
        ],
      ),
    );
  }
}

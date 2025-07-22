import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoormedicalstore/provider/cart_provider.dart';
import 'package:hoormedicalstore/provider/order_provider.dart';
import 'package:hoormedicalstore/provider/profile_provider.dart';
import 'package:hoormedicalstore/screen/account_screen.dart';
import 'package:hoormedicalstore/screen/cart_screen.dart';
import 'package:hoormedicalstore/screen/login_screen.dart';

import 'package:hoormedicalstore/screen/order_screen.dart';
import 'package:hoormedicalstore/screen/profile.dart';
import 'package:hoormedicalstore/screen/q_r_scanner_screen.dart';
import 'package:hoormedicalstore/screen/settings.dart';
import 'package:hoormedicalstore/widget/app_drawer.dart';
import 'package:hoormedicalstore/widget/home_grid_item_ui.dart';

import 'package:provider/provider.dart';

enum popupmenu { profile, logout, settings }

class ProductOverviewScreen extends StatefulWidget {
  static const routeName = '/ProductOverViewScreen';

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _islogin = true;
  int _currentindex = 0;

  final List<Widget> children = [
    HomeGridItemUi(),
    CartScreen(
      showAppBar: false,
    ),
    QRScannerScreen(),
    AccountScreen()
  ];

  @override
  void initState() {
    children[0] = HomeGridItemUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'Hoor Medical',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        actions: [
          PopupMenuButton(
            onSelected: (popupmenu value) {
              if (value == popupmenu.profile) {
                Navigator.of(context).pushReplacementNamed(Profile.routeName);
              }
              if (value == popupmenu.settings) {
                Navigator.of(context).pushReplacementNamed(Settings.routeName);
              }
              if (value == popupmenu.logout) {
                setState(() {
                  _islogin = false;
                });
              }
            },
            child: Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                if (profileProvider.items.isEmpty) {
                  return Column(
                    children: [
                      Icon(Icons.person),
                    ],
                  );
                } else {
                  return CircleAvatar(
                    radius: 15,
                    backgroundImage:
                        FileImage(File(profileProvider.items.first.imageurl)),
                  );
                }
              },
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  'Profile',
                ),
                value: popupmenu.profile,
              ),
              PopupMenuItem(
                child: Text(
                  'Settings',
                ),
                value: popupmenu.settings,
              ),
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text(
                    _islogin ? 'Logout' : 'Login',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                value: popupmenu.logout,
              ),
            ],
          ),
          SizedBox(
            width: 0,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderScreen.routeName);
              },
              icon: Badge(
                label: Text(
                    Provider.of<OrderProvider>(context).itemcount.toString()),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              )),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
        ),
      ),
      drawer: AppDrawer(
        Provider.of<ProfileProvider>(context).items.first.name,
      ),
      body: children[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentindex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Badge(
                label: Text(cart.itemcount.toString()),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
              label: 'Scan'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              label: 'Account')
        ],
      ),
    );
  }
}

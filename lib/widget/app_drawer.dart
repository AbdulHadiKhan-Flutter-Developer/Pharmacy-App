import 'package:flutter/material.dart';
import 'package:hoormedicalstore/provider/order_provider.dart';
import 'package:hoormedicalstore/screen/order_screen.dart';

import 'package:hoormedicalstore/screen/product_overview_screen.dart';
import 'package:hoormedicalstore/screen/settings.dart';
import 'package:hoormedicalstore/screen/terms_condition.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  static const routeName = '/AppDrawerScreen';
  final String name;
  AppDrawer(this.name);
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
              'Hello! ${name}',
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            iconColor: Colors.deepPurple,
            trailing: Icon(Icons.shop),
            title: Text(
              'Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ProductOverviewScreen.routeName),
          ),
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
            trailing: Icon(Icons.confirmation_num_rounded),
            title: Text(
              'terms & condition',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(TermsCondition.routeName),
          ),
          Divider(),
          ListTile(
            iconColor: Colors.deepPurple,
            trailing: Icon(Icons.settings),
            title: Text(
              'Setting',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(Settings.routeName),
          ),
        ],
      ),
    );
  }
}

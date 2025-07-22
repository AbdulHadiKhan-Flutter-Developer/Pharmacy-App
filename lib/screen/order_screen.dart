import 'package:flutter/material.dart';
import 'package:hoormedicalstore/provider/order_provider.dart';
import 'package:hoormedicalstore/screen/product_overview_screen.dart';
import 'package:hoormedicalstore/widget/order_item_ui.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/OrderScreen';

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(ProductOverviewScreen.routeName),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        title: Text(
          'My order\'s',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItemUi(order.items[index]),
        itemCount: order.items.length,
      ),
    );
  }
}

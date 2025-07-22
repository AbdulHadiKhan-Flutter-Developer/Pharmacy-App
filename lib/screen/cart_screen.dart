import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hoormedicalstore/model/cart_model.dart';
import 'package:hoormedicalstore/provider/cart_provider.dart';

import 'package:hoormedicalstore/screen/checkout_screen.dart';

import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  final bool showAppBar;

  final _currentindex = 0;
  const CartScreen({
    Key? key,
    this.showAppBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ci = Provider.of<CartProvider>(context, listen: true);
    print('Cart screen uptodate: ${ci.items.length} items');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: showAppBar
          ? AppBar(
              centerTitle: true,
              leading: _currentindex == 0
                  ? BackButton(
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop())
                  : null,
              toolbarHeight: 70,
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              title: Text(
                'My Cart',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white),
              ),
            )
          : null,
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 555,
              child: FutureBuilder(
                  future: FirebaseFirestore.instance.collection('cart').get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error while fetching data'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CupertinoActivityIndicator());
                    }
                    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No Item Found'));
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final data = snapshot.data!.docs[index];

                          // Extract only available fields
                          CartModel cartModel = CartModel(
                              createdAt: data['createdAt'] ?? Timestamp.now(),
                              productTitle: data['productTitle'] ?? 'no title',
                              productPrice: data['productPrice'] ?? 'price',
                              productDescription:
                                  data['productDescription'] ?? 'description',
                              userAddress: data['userAddress'] ?? 'useraddress',
                              totalAmount: data['totalAmount'] ?? 'totalamount',
                              userName: data['userName'] ?? 'Username',
                              quantity: data['quantity'] ?? 'quantity');

                          return Card(
                            color: Colors.deepPurple,
                            elevation: 5,
                            child: Column(
                              children: [
                                Text(cartModel.productTitle),
                                Text(cartModel.productDescription),
                                Text(cartModel.productPrice.toString()),
                                Text(cartModel.createdAt.toString()),
                              ],
                            ),
                          );
                        });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
                height: 70,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Chip(
                          label: Text(
                        'Total: ${(ci.totalAmount).toStringAsFixed(2)}-/pkr',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple),
                              onPressed: () {
                                final cartprovider = Provider.of<CartProvider>(
                                    context,
                                    listen: false);
                                final cartitem =
                                    cartprovider.items.values.toList();
                                final checkamount = cartprovider.totalAmount;
                                if (cartprovider.itemcount == 0) {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                            title: Text('Cart is empty!'),
                                            content: Text(
                                                'Please add At least single item.'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(false),
                                                  child: Text(
                                                    'Ok',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ))
                                            ],
                                          ));
                                } else {
                                  Navigator.of(context).pushNamed(
                                      CheckoutScreen.routeName,
                                      arguments: CheckoutArguments(
                                          cartitems: cartitem,
                                          totalamount: checkamount));
                                }
                              },
                              child: Text(
                                'CheckOut',
                                style: TextStyle(color: Colors.white),
                              ))),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class CheckoutArguments {
  final List<CartItem> cartitems;
  final double totalamount;

  CheckoutArguments({required this.cartitems, required this.totalamount});
}

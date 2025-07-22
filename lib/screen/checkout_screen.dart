import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hoormedicalstore/provider/profile_provider.dart';
import 'package:hoormedicalstore/screen/cart_screen.dart';

import 'package:hoormedicalstore/screen/profile_edited_screen.dart';
import 'package:hoormedicalstore/widget/checkout_item_ui.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  final User? userid = FirebaseAuth.instance.currentUser;
  static const routeName = '/CheckOutScreen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as CheckoutArguments;
    final cartitem = args.cartitems;
    final amount = args.totalamount;
    // final checkoutitem = Provider.of<ProductProvider>(context).findbyid(args);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(CartScreen.routeName),
          ),
          backgroundColor: Colors.deepPurple,
          toolbarHeight: 70,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          title: Text(
            'CheckOut',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 2, top: 10),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      child: Container(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/location.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                Provider.of<ProfileProvider>(context)
                                    .items
                                    .first
                                    .name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                          ProfileEditedScreen.routeName),
                                  icon: Icon(
                                    Icons.edit,
                                    size: 15,
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Container(
                                  height: 20,
                                  width: 46,
                                  child: Center(
                                    child: Text(
                                      'Home',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  color: const Color.fromARGB(255, 14, 68, 161),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    Provider.of<ProfileProvider>(context)
                                        .items
                                        .first
                                        .currentaddress,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartitem.length,
                    itemBuilder: (context, index) {
                      final cartit = cartitem[index];

                      return CheckoutItemUi(
                          imageurl: cartit.imageurl,
                          title: cartit.title,
                          price: cartit.price,
                          quantity: cartit.quantity,
                          description: cartit.description);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 10),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                            label: Text(
                          'Subtotal: ${(amount).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (userid == null) {
                                print('No user login');
                                return;
                              }

                              var userAddress = Provider.of<ProfileProvider>(
                                      context,
                                      listen: false)
                                  .items
                                  .first
                                  .currentaddress;
                              var totalAmount = amount;
                              var userName = Provider.of<ProfileProvider>(
                                      context,
                                      listen: false)
                                  .items
                                  .first
                                  .name;

                              try {
                                for (var cartit in cartitem) {
                                  await FirebaseFirestore.instance
                                      .collection('Orders')
                                      .add({
                                    'productTitle': cartit.title,
                                    'productPrice': cartit.price,
                                    'productDescription': cartit.description,
                                    'userAddress': userAddress,
                                    'totalAmount': totalAmount,
                                    'userName': userName,
                                    'quantity': cartit.quantity,
                                    'createdAt': DateTime.now(),
                                    'userID': userid!.uid,
                                  });
                                }
                                print('Order placed successfully');
                              } catch (e) {
                                print('Error: $e');
                              }
                            },
                            child: Text(
                              'Place Order',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

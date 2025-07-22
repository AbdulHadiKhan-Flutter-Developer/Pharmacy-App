// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hoormedicalstore/provider/cart_provider.dart';
import 'package:hoormedicalstore/provider/product_provider.dart';
import 'package:hoormedicalstore/provider/profile_provider.dart';
import 'package:hoormedicalstore/screen/cart_screen.dart';
import 'package:hoormedicalstore/screen/product_overview_screen.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/ProductDetailScreen';
  final User? userid = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final String arg = ModalRoute.of(context)?.settings.arguments as String;
    final loadedproduct = Provider.of<ProductProvider>(context).findbyid(arg);

    final cart = Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(ProductOverviewScreen.routeName),
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        toolbarHeight: 70,
        backgroundColor: Colors.deepPurple,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) => IconButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(CartScreen.routeName),
              icon: Badge(
                label: Text(cart.itemcount
                    .toString()), // This will now update dynamically
                child: Icon(Icons.shopping_cart, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    loadedproduct.imageurl,
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Chip(
                      label: Text(
                    'Price: ${loadedproduct.Price.toString()}-/pkr',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: 21,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      '1X',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      '2X',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      '1X Box',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      '2X Box',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      height: 30,
                      width: 50,
                      child: Card(
                          color: const Color.fromARGB(181, 221, 131, 131),
                          child: Center(
                              child: Text(
                            'Status',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 8),
                          )))),
                  Text(
                    'Available',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    loadedproduct.description,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.safety_check_rounded,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '6 days easy return',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.delivery_dining_outlined,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'With in 2 hours delivery',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.approval,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Approved by Gov.Pak',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(300, 40),
                                backgroundColor: Colors.deepPurple,
                              ),
                              onPressed: () async {
                                if (userid == null) {
                                  print('No user login');
                                  return;
                                }

                                final profileProvider =
                                    Provider.of<ProfileProvider>(context,
                                        listen: false);
                                final cartProvider = Provider.of<CartProvider>(
                                    context,
                                    listen: false);

                                if (profileProvider.items.isEmpty) {
                                  print('No user profile found');
                                  return;
                                }

                                final userAddress =
                                    profileProvider.items.first.currentaddress;
                                final userName =
                                    profileProvider.items.first.name;
                                final productID = loadedproduct.id;

                                try {
                                  final cartRef = FirebaseFirestore.instance
                                      .collection('cart')
                                      .doc(productID);

                                  final doc = await cartRef.get();

                                  if (doc.exists) {
                                    await cartRef.update({
                                      'quantity': (doc['quantity'] ?? 0) + 1,
                                      'totalAmount': (doc['totalAmount'] ?? 0) +
                                          loadedproduct.Price,
                                    });
                                  } else {
                                    await cartRef.set({
                                      'productID': productID,
                                      'productTitle': loadedproduct.title,
                                      'productPrice': loadedproduct.Price,
                                      'productDescription':
                                          loadedproduct.description,
                                      'userAddress': userAddress,
                                      'totalAmount': loadedproduct.Price,
                                      'userName': userName,
                                      'quantity': 1,
                                      'createdAt': FieldValue.serverTimestamp(),
                                      'userID': userid!.uid,
                                    });
                                  }

                                  print('Item added to cart successfully');

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Item added to cart!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } catch (e) {
                                  print('Error adding to cart: $e');
                                }
                              },
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

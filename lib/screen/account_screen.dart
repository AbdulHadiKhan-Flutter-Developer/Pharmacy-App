import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoormedicalstore/provider/order_provider.dart';
import 'package:hoormedicalstore/provider/profile_provider.dart';
import 'package:hoormedicalstore/screen/order_screen.dart';
import 'package:hoormedicalstore/screen/settings.dart';

import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orde = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(Settings.routeName),
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                FittedBox(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(File(
                        Provider.of<ProfileProvider>(context)
                            .items
                            .first
                            .imageurl)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  Provider.of<ProfileProvider>(context).items.first.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              'My Orders',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.payment,
                        size: 35,
                        color: Colors.deepPurple,
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'To Pay',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                width: 13,
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(OrderScreen.routeName);
                    },
                    icon: Badge(
                      label: Text(orde.itemcount.toString()),
                      child: Icon(
                        Icons.local_shipping,
                        size: 35,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Order\'s',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                width: 13,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.call_received_rounded,
                        size: 35,
                        color: Colors.deepPurple,
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'To Receive',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                width: 13,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.reviews,
                        size: 35,
                        color: Colors.deepPurple,
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'To Review',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                width: 13,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_return_sharp,
                        size: 35,
                        color: Colors.deepPurple,
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Returns',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  'Hoor Wallet',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 80,
                      width: 170,
                      child: Card(
                        color: Colors.deepPurple,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hoor Coins',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          )),
                        ),
                      )),
                  Container(
                      height: 80,
                      width: 170,
                      child: Card(
                        color: Colors.deepPurple,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'No payment Medtho',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          )),
                        ),
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

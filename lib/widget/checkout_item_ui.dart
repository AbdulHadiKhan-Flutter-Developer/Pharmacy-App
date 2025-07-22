import 'package:flutter/material.dart';

class CheckoutItemUi extends StatelessWidget {
  final String imageurl;
  final String title;
  final double price;
  final int quantity;
  final String description;

  const CheckoutItemUi({
    super.key,
    required this.imageurl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.deepPurple,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '${title}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            height: 100,
                            child: FittedBox(
                              child: Image.asset(
                                imageurl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Chip(
                                      label: Text(
                                    'Price: ${(price * quantity).toStringAsFixed(2)}-/pkr',
                                    style: TextStyle(color: Colors.black),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 9),
                                  child: Text(
                                    'Qty: ${quantity}x',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

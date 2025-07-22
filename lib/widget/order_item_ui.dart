import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hoormedicalstore/provider/order_provider.dart';
import 'package:intl/intl.dart';

class OrderItemUi extends StatefulWidget {
  final OrderItem ord;
  OrderItemUi(this.ord);

  @override
  State<OrderItemUi> createState() => _OrderItemUiState();
}

class _OrderItemUiState extends State<OrderItemUi> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.deepPurple,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.playlist_add_check_circle_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${widget.ord.amount.toStringAsFixed(2)}-/pkr',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              subtitle: Text(
                DateFormat('dd MM yyyy hh:mm').format(
                  widget.ord.time,
                ),
                style: TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  icon: Icon(
                    _expanded
                        ? Icons.expand_circle_down
                        : Icons.expand_circle_down_outlined,
                    color: Colors.white,
                  )),
            ),
            if (_expanded)
              Container(
                  height: min(widget.ord.products.length * 20 + 100, 80),
                  child: ListView(
                    children: widget.ord.products
                        .map((pro) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        pro.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${pro.quantity}X',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${pro.price}-/pkr',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ))
          ],
        ),
      ),
    );
  }
}

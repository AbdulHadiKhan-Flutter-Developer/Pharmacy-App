import 'package:flutter/material.dart';

import '../provider/cart_provider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime time;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.time});
}

class OrderProvider extends ChangeNotifier {
  List<OrderItem> _Items = [];

  List<OrderItem> get items {
    return [..._Items];
  }

  void addorder(List<CartItem> cartproduct, double total) {
    _Items.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartproduct,
        time: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  int get itemcount {
    return _Items.length;
  }
}

import 'package:flutter/material.dart';

class CheckOutItem {
  final String id;
  final String title;
  final String description;
  final String imageurl;
  final double price;
  final int quantity;

  CheckOutItem(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.price,
      required this.quantity});
}

class CheckoutProvider extends ChangeNotifier {
  List<CheckOutItem> _items = [];

  List<CheckOutItem> get items {
    return [..._items];
  }

  void clearcheckout() {
    _items = [];
    notifyListeners();
  }
}

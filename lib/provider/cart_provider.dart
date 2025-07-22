import 'package:flutter/material.dart';

class CartItem {
  final String description;

  final String id;
  final String title;
  final String imageurl;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.imageurl,
      required this.description,
      required this.quantity,
      required this.price});
}

class CartProvider extends ChangeNotifier {
  Map<String, CartItem> _Items = {};
  Map<String, CartItem> get items {
    return {..._Items};
  }
  // [
  //   // CartItem(
  //   //     id: 'id',
  //   //     title: 'title',
  //   //     description: 'Rigix syrup is a medication.',
  //   //     imageurl:
  //   //         'https://shop.marham.pk/cdn/shop/files/Rigix120mlSyrup_28873cf9-07d5-4fc5-abaf-4349f72218de.webp?v=1717733907&width=480',
  //   //     date: DateTime.now(),
  //   //     quantity: 1,
  //   //     price: 250),
  //   // CartItem(
  //   //     id: 'id',
  //   //     title: 'title 2',
  //   //     imageurl:
  //   //         'https://media.naheed.pk/catalog/product/cache/49dcd5d85f0fa4d590e132d0368d8132/1/0/1003016-1.jpg',
  //   //     description: 'description',
  //   //     date: DateTime.now(),
  //   //     quantity: 2,
  //   //     price: 300)
  // ];

  // List<CartItem> get items {
  //   return [..._Items];
  // }

  double get totalAmount {
    var total = 0.0;
    _Items.forEach((key, carti) {
      total += carti.price * carti.quantity;
    });
    return total;
  }

  void addproducttocart(String productID, String title, String imageurl,
      double price, String description) {
    if (_Items.containsKey(productID)) {
      _Items.update(
          productID,
          (existingcartitem) => CartItem(
              id: existingcartitem.id,
              title: existingcartitem.title,
              imageurl: existingcartitem.imageurl,
              description: existingcartitem.description,
              quantity: existingcartitem.quantity + 1,
              price: existingcartitem.price));
    } else {
      _Items.putIfAbsent(
          productID,
          () => CartItem(
              id: productID,
              title: title,
              imageurl: imageurl,
              description: description,
              quantity: 1,
              price: price));
    }
    print('Product added to cart: $title');
    notifyListeners();
  }

  int get itemcount {
    return _Items.length;
  }

  void removeitem(String id) {
    _Items.remove(id);
    notifyListeners();
  }

  void singleCartItemRemoves(String prodId) {
    if (!_Items.containsKey(prodId)) {
      return;
    }
    if (_Items[prodId]?.quantity != null && _Items[prodId]!.quantity > 1) {
      _Items.update(
          prodId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity - 1,
              title: existingCartItem.title,
              imageurl: existingCartItem.imageurl,
              description: existingCartItem.description));
    } else {
      _Items.remove(prodId);
    }
    notifyListeners();
  }

  void clearcart() {
    _Items = {};
    notifyListeners();
  }
}

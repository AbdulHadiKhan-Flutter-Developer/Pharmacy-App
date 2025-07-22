import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String productTitle;
  final double productPrice;
  final String productDescription;
  Timestamp createdAt;
  final String userAddress;
  final double totalAmount;
  final String userName;
  final int quantity;

  CartModel(
      {required this.createdAt,
      required this.productTitle,
      required this.productPrice,
      required this.productDescription,
      required this.userAddress,
      required this.totalAmount,
      required this.userName,
      required this.quantity});
}

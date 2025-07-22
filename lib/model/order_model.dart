import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String productTitle;
  final String productPrice;
  final String productDescription;
  Timestamp createdAt;
  final String userAddress;
  final String totalAmount;
  final String userName;
  final String quantity;

  OrderModel(
      {required this.productTitle,
      required this.productPrice,
      required this.productDescription,
      required this.userName,
      required this.totalAmount,
      required this.quantity,
      required this.userAddress,
      required this.createdAt});
}

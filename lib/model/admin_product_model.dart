import 'package:cloud_firestore/cloud_firestore.dart';

class AdminProductModel {
  final String ProductTitle;
  final String ProductPrice;
  final String ProductDescription;
  Timestamp CreatedAt;

  AdminProductModel(
      {required this.ProductTitle,
      required this.CreatedAt,
      required this.ProductPrice,
      required this.ProductDescription});
}

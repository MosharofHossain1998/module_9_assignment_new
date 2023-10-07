import 'package:flutter/cupertino.dart';

class ProductDetails {
  final String productName;
  final String productImage;
  final String productColor;
  final String productSize;
  final double productPrice;

  ProductDetails({
    required this.productName,
    required this.productImage,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
  });
}
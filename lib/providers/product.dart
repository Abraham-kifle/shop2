import 'package:flutter/material.dart';
import 'product_type.dart';

class Product extends ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final List<ProductType> types;
  bool isFavorite;
  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.types,
    this.isFavorite = false,
  });
}

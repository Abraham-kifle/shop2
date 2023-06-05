import 'package:flutter/material.dart';

class ProductType extends ChangeNotifier {
  final String id;
  final String name;
  final String productQuality;
  final double price;
  final String image;
  final String description;
  bool isFavorite;
  bool isAddToCart;

  ProductType({
    required this.id,
    required this.name,
    required this.productQuality,
    required this.price,
    required this.image,
    required this.description,
    this.isFavorite = false,
    this.isAddToCart = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  where(Function(dynamic prodItem) param0) {}

  copyWith({required String name}) {}
}

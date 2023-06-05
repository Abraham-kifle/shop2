import 'dart:math';

import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String image;
  final String title;
  int quantity;
  double price;
  String unit;
  String description;

  CartItem({
    required this.id,
    required this.image,
    required this.title,
    required this.quantity,
    required this.price,
    required this.description,
    this.unit = 'kilo',
  });

  String getUnit() {
    return unit;
  }
}

class Cart extends ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  String setUnit(String singleUnit, String id) {
    final itemIndex =
        _items.values.toList().indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      final item = _items.values.toList()[itemIndex];
      item.unit = singleUnit;
      return item.unit;
    }
    return '';
  }

  String getUnit(String id) {
    final itemIndex =
        _items.values.toList().indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      final item = _items.values.toList()[itemIndex];
      return item.unit;
    }
    return '';
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((id, cartItem) {
      if (cartItem.unit == 'kilo') {
        total += cartItem.price * cartItem.quantity;
      } else if (cartItem.unit == 'kuntal') {
        total += cartItem.price * cartItem.quantity * 100;
      }
    });
    return total;
  }

  int qunaIndex = 1;

  void updateQuantity(
    String itemId,
    int quantity,
  ) {
    final itemIndex =
        _items.values.toList().indexWhere((item) => item.id == itemId);
    final item = _items.values.toList()[itemIndex];
    item.quantity = quantity;
    if (itemIndex >= 0 && item.unit == 'kilo') {
      item.unit = 'kilo';
    } else if (itemIndex >= 0 && item.unit == 'kuntal') {
      item.unit = 'kuntal';
    }
    notifyListeners();
  }

  void addItem(
    String productId,
    String name,
    String image,
    double price,
    String title,
    String description,
  ) {
    //the method first check if the cart already contains an item with the given
    //'productId'
    if (_items.containsKey(productId)) {
      //change quantity...
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                image: existingCartItem.image,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity,
                description: existingCartItem.description,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                image: image,
                title: title,
                price: price,
                quantity: 1,
                description: description,
              ));
    }
    notifyListeners();
  }

  bool contains(String productId) {
    return _items.containsKey(productId);
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                image: existingCartItem.image,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity - 1,
                price: existingCartItem.price,
                description: existingCartItem.description,
              ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  int addPlus = 0;
}

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:inthe_store/models/product.dart';

class CartItem {
  CartItem({
    required this.product,
    this.qty = 1,
  });

  final Product product;
  int qty;
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items {
    return UnmodifiableListView(_items);
  }

  void addToCart(Product product, {qty = 1}) {
    if (inCart(product)) return;
    _items.add(CartItem(
      product: product, 
      qty: qty
    ));
    notifyListeners();
  }

  void removeFromCart(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void incItemQty(int index) {
    _items[index].qty++;
    notifyListeners();
  }
  
  void decItemQty(int index) {
    if (_items[index].qty <= 1) return;
    _items[index].qty--;
    notifyListeners();
  }

  int get totalPrice {
    int ret = 0;
    for (int i = 0; i < _items.length; i++) {
      ret += _items[i].product.price * _items[i].qty;
    }
    return ret;
  }

  bool inCart(Product product) {
    return _items.any((item) => item.product == product);
  }
}

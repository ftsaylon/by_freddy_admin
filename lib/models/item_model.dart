import 'package:flutter/material.dart';

class Item with ChangeNotifier {
  String id;
  String activity;
  double rate;
  int quantity;
  String tax;
  double total;

  Item({
    this.id,
    this.activity,
    this.rate,
    this.quantity,
    this.tax,
    this.total,
  });

  void increaseQuantity() {
    this.quantity++;
    this.total *= this.quantity;
    notifyListeners();
  }

  void decreaseQuantity() {
    this.quantity--;
    this.total *= this.quantity;
    notifyListeners();
  }
}

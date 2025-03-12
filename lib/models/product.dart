import 'package:flutter/foundation.dart';

@immutable
class Product {
  final String title;
  final double price;

  String get priceAsString => price.toStringAsFixed(2);

  const Product({required this.title, required this.price});

  Product copyWithDiscount() {
    return Product(title: title, price: price * 0.8);
  }

  Product copyWithoutDiscount() {
    return Product(title: title, price: price * 1.25);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          price == other.price;

  @override
  int get hashCode => title.hashCode ^ price.hashCode;
}

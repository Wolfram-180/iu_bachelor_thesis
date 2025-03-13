import 'package:flutter/foundation.dart';

@immutable
class Product {
  final String title;
  final double price;

  String get priceAsString => price.toStringAsFixed(2);

  const Product({required this.title, required this.price});

  Product copyWithDiscount() => Product(title: title, price: price * 0.8);
}

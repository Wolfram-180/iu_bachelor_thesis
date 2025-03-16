import 'package:flutter/foundation.dart';

@immutable
class Product {
  final String title;
  final double price;
  final double originalPrice;

  String get priceAsString => price.toStringAsFixed(2);

  const Product({
    required this.title,
    required this.price,
    double? originalPrice,
  }) : originalPrice = originalPrice ?? price;

  Product copyWithDiscount() =>
      Product(title: title, price: price * 0.8, originalPrice: originalPrice);

  Product restoreOriginalPrice() =>
      Product(title: title, price: originalPrice, originalPrice: originalPrice);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          originalPrice == other.originalPrice;

  @override
  int get hashCode => title.hashCode ^ originalPrice.hashCode;
}

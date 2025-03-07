import 'package:flutter/foundation.dart';
import 'package:iu_bachelor_thesis/models/product.dart';

@immutable
class CartItem {
  final Product product;
  final int amount;

  double get totalPrice => product.price * amount;
  String get totalPriceAsString => totalPrice.toStringAsFixed(2);

  const CartItem({required this.product, required this.amount})
    : assert(amount >= 0);
}

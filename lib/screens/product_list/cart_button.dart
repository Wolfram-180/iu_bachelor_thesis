import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/route_key.dart';

class CartButton extends StatelessWidget {
  const CartButton() : super(key: const Key('cart_button'));

  @override
  Widget build(BuildContext context) {
    BenchmarkCounters.cartButton++;
    return ElevatedButton.icon(
      onPressed: () => Navigator.of(context).pushRouteKey(RouteKey.cart),
      icon: const Icon(Icons.shopping_basket),
      label: const Text('Cart (3 Items)'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/route_key.dart';
import 'package:iu_bachelor_thesis/store/cart_store.dart';

class CartButton extends StatelessWidget {
  const CartButton() : super(key: const Key('cart_button'));

  @override
  Widget build(BuildContext context) {
    final numberOfProducts = context.select<CartStore, int>(
      (store) => store.numberOfProducts,
    );
    BenchmarkCounters.cartButton++;
    return ElevatedButton.icon(
      onPressed: () => Navigator.of(context).pushRouteKey(RouteKey.cart),
      icon: const Icon(Icons.shopping_basket),
      label: Text('Cart ($numberOfProducts Items)'),
    );
  }
}

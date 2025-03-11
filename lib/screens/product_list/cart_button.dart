import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/route_key.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';

class CartButton extends ConsumerWidget {
  const CartButton() : super(key: const Key('cart_button'));

  @override
  Widget build(BuildContext context, ref) {
    final count = ref.watch(totalProductInCartCountProvider);
    BenchmarkCounters.cartButton++;
    return ElevatedButton.icon(
      onPressed: () => Navigator.of(context).pushRouteKey(RouteKey.cart),
      icon: const Icon(Icons.shopping_basket),
      label: Text('Cart ($count Items)'),
    );
  }
}

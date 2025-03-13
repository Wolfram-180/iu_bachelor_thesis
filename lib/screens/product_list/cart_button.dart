import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/route_key.dart';
import 'package:iu_bachelor_thesis/stores/store_injector.dart';

class CartButton extends StatelessWidget {
  const CartButton() : super(key: const Key('cart_button'));

  @override
  Widget build(BuildContext context) {
    final cartStore = StoreInjector.of(context).cartStore;
    return Observer(
      builder: (context) {
        BenchmarkCounters.cartButton++;
        return ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pushRouteKey(RouteKey.cart),
          icon: const Icon(Icons.shopping_basket),
          label: Text('Cart (${cartStore.numberOfItems} Items)'),
        );
      },
    );
  }
}

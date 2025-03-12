import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';
import 'package:iu_bachelor_thesis/route_key.dart';

class CartButton extends StatelessWidget {
  const CartButton() : super(key: const Key('cart_button'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store) => store.state.cart.length,
      builder: (context, itemCount) {
        BenchmarkCounters.cartButton++;
        return ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pushRouteKey(RouteKey.cart),
          icon: const Icon(Icons.shopping_basket),
          label: Text('Cart ($itemCount Items)'),
        );
      },
    );
  }
}

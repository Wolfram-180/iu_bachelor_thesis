import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/bloc_provider.dart';
import 'package:iu_bachelor_thesis/route_key.dart';

class CartButton extends StatelessWidget {
  const CartButton() : super(key: const Key('cart_button'));

  @override
  Widget build(BuildContext context) {
    final cartBloc = AppState.of(context).blocProvider.cartBloc;
    return StreamBuilder<int>(
      stream: cartBloc.numberOfProductsStream,
      initialData: cartBloc.numberOfProducts,
      builder: (context, snapshot) {
        BenchmarkCounters.cartButton++;
        return ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pushRouteKey(RouteKey.cart),
          icon: const Icon(Icons.shopping_basket),
          label: Text('Cart (${snapshot.requireData} Items)'),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iu_bachelor_thesis/stores/store_injector.dart';

class TotalPriceText extends StatelessWidget {
  const TotalPriceText({super.key});

  @override
  Widget build(BuildContext context) {
    final cartStore = StoreInjector.of(context).cartStore;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(
          builder:
              (context) => Text(
                'Total: ${cartStore.totalPrice.toStringAsFixed(2)}\$',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(fontSize: 24),
              ),
        ),
      ),
    );
  }
}

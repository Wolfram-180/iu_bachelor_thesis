import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/store/cart_store.dart';

class TotalPriceText extends StatelessWidget {
  const TotalPriceText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalPrice = context
        .select<CartStore, double>((store) => store.totalPrice)
        .toStringAsFixed(2);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Total: $totalPrice€',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 24),
        ),
      ),
    );
  }
}

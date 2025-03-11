import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';

class TotalPriceText extends ConsumerWidget {
  const TotalPriceText({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final totalPrice = ref.watch(totalPriceProvider).toStringAsFixed(2);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Total: $totalPrice\$',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 24),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';

class TotalPriceText extends StatelessWidget {
  const TotalPriceText({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (store) => store.state.totalPrice.toStringAsFixed(2),
      builder:
          (context, price) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total: $price\$',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(fontSize: 24),
              ),
            ),
          ),
    );
  }
}

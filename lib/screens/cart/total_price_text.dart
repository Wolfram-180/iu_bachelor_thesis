import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/bloc_provider.dart';

class TotalPriceText extends StatelessWidget {
  const TotalPriceText({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = AppState.of(context).blocProvider.cartBloc;
    return StreamBuilder<double>(
      stream: cartBloc.totalPriceStream,
      initialData: cartBloc.totalPrice,
      builder: (context, snapshot) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total: ${snapshot.requireData.toStringAsFixed(2)}\$',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontSize: 24),
            ),
          ),
        );
      },
    );
  }
}

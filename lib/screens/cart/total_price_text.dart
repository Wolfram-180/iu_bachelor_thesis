import 'package:flutter/material.dart';

class TotalPriceText extends StatelessWidget {
  const TotalPriceText({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Total: 27\$',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 24),
        ),
      ),
    );
  }
}

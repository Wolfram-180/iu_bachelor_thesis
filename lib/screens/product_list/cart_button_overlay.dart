import 'package:flutter/material.dart';
import 'cart_button.dart';

class CartButtonOverlay extends StatelessWidget {
  final Widget child;
  const CartButtonOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        const Positioned(
          left: 8,
          bottom: 8,
          right: 8,
          child: SafeArea(child: CartButton()),
        ),
      ],
    );
  }
}

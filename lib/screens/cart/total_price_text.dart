import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/controllers/cart_controller.dart';

class TotalPriceText extends StatelessWidget {
  const TotalPriceText({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Total: ${cartController.totalPrice.value.toStringAsFixed(2)}\$',
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

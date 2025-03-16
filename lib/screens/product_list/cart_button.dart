import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/controllers/cart_controller.dart';
import 'package:iu_bachelor_thesis/route_key.dart';

class CartButton extends StatelessWidget {
  const CartButton() : super(key: const Key('cart_button'));

  @override
  Widget build(BuildContext context) {
    BenchmarkCounters.cartButton++;
    final cartController = Get.find<CartController>();

    return Obx(
      () => ElevatedButton.icon(
        onPressed: () => Navigator.of(context).pushRouteKey(RouteKey.cart),
        icon: const Icon(Icons.shopping_basket),
        label: Text('Cart (${cartController.numberOfProducts} Items)'),
      ),
    );
  }
}

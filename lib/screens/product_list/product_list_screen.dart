import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import 'cart_button_overlay.dart';
import 'product_list.dart';

class ProductListScreen extends GetView<ProductController> {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IU Bachelor Thesis'),
        actions: [
          Obx(
            () => Switch(
              value: controller.isSignedIn.value,
              onChanged: (_) => controller.toggleSignIn(),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return CartButtonOverlay(
          child: ProductList(products: controller.products),
        );
      }),
    );
  }
}

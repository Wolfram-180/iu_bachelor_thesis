import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/controllers/product_controller.dart';
import 'package:iu_bachelor_thesis/controllers/user_controller.dart';
import 'package:iu_bachelor_thesis/models/products_state.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';
import 'cart_button_overlay.dart';
import 'product_list.dart';

class ProductListScreen extends GetView<ProductController> {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('IU Bachelor Thesis'),
        actions: [
          Obx(
            () => UserSwitch(
              isOn: userController.isSignedIn.value,
              onChanged:
                  (_) => userController.updateSignInStatus(
                    !userController.isSignedIn.value,
                  ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.productsState.value is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return CartButtonOverlay(
          child: ProductList(
            products:
                (controller.productsState.value as ProductsLoaded).products,
          ),
        );
      }),
    );
  }
}

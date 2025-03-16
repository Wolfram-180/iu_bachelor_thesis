import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/controllers/cart_controller.dart';
import 'package:iu_bachelor_thesis/controllers/user_controller.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';
import 'cart_item_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(() {
            return Expanded(
              child: CartItemList(items: cartController.toCartItems()),
            );
          }),
          TotalPriceText(),
        ],
      ),
    );
  }
}

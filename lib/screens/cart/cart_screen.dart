import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/controllers/cart_controller.dart';
import 'package:iu_bachelor_thesis/models/cart_item.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_item_list.dart';

const _placeHolderItems = [
  CartItem(product: Product(title: 'Apples', price: 3), amount: 3),
  CartItem(product: Product(title: 'Apples', price: 3), amount: 3),
  CartItem(product: Product(title: 'Apples', price: 3), amount: 3),
];

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [UserSwitch(isOn: true, onChanged: (_) {})],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Expanded(child: CartItemList(items: _placeHolderItems)),
          TotalPriceText(),
        ],
      ),
    );
  }
}

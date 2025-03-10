import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';
import 'package:iu_bachelor_thesis/store/cart_store.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_item_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<CartStore>().cart;
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), actions: const [UserSwitch()]),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: CartItemList(items: items)),
          const TotalPriceText(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_item_list.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), actions: const [UserSwitch()]),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: CartItemList(items: ref.watch(cartItemListProvider))),
          const TotalPriceText(),
        ],
      ),
    );
  }
}

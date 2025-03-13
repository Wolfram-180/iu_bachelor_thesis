import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';
import 'package:iu_bachelor_thesis/stores/store_injector.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_item_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), actions: const [UserSwitch()]),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Observer(
              builder:
                  (context) => CartItemList(
                    items: StoreInjector.of(context).cartStore.cart,
                  ),
            ),
          ),
          const TotalPriceText(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/bloc/cart_bloc.dart';
import 'package:iu_bachelor_thesis/bloc_provider.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_item_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = AppState.of(context).blocProvider.cartBloc;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [UserSwitch(isOn: true, onChanged: (_) {})],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: StreamBuilder<Cart>(
              stream: cartBloc.cartStream,
              initialData: cartBloc.cart,
              builder: (context, snapshot) {
                return CartItemList(items: snapshot.requireData.toCartItems());
              },
            ),
          ),
          const TotalPriceText(),
        ],
      ),
    );
  }
}

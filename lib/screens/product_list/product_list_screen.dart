import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_button_overlay.dart';
import 'product_list.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IU Bachelor Thesis'),
        actions: [UserSwitch(isOn: true, onChanged: (_) {})],
      ),
      body: StoreConnector<AppState, RemoteProducts>(
        converter: (store) => store.state.remoteProductsWithDiscount,
        builder:
            (context, remoteProducts) => remoteProducts.when(
              finished:
                  (products) =>
                      CartButtonOverlay(child: ProductList(products: products)),
              error: (errorMessage) => Center(child: Text(errorMessage)),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
      ),
    );
  }
}

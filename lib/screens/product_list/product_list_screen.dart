import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iu_bachelor_thesis/stores/store_injector.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_button_overlay.dart';
import 'product_list.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productStore = StoreInjector.of(context).productStore;
    return Scaffold(
      appBar: AppBar(
        title: const Text('IU Bachelor Thesis'),
        actions: const [UserSwitch()],
      ),
      body: Observer(
        builder:
            (BuildContext context) =>
                productStore.products.match(
                  fulfilled:
                      (products) => CartButtonOverlay(
                        child: ProductList(products: products),
                      ),
                  rejected:
                      (errorMessage) =>
                          Center(child: Text(errorMessage.toString())),
                  pending:
                      () => const Center(child: CircularProgressIndicator()),
                ) ??
                Container(),
      ),
    );
  }
}

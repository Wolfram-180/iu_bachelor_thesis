import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/models/remote_resource.dart';
import 'package:iu_bachelor_thesis/store/product_store.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_button_overlay.dart';
import 'product_list.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IU Bachelor Thesis'),
        actions: const [UserSwitch()],
      ),
      body: const _ProductListSwitch(),
    );
  }
}

class _ProductListSwitch extends StatelessWidget {
  const _ProductListSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productStore = context.watch<ProductStore>();
    final remoteProducts = productStore.products;
    if (remoteProducts is LoadingRemoteResource) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (remoteProducts is ErrorRemoteResource) {
      return Center(child: Text(remoteProducts.asError().errorMessage));
    }
    return CartButtonOverlay(
      child: ProductList(products: remoteProducts.asFinished().value),
    );
  }
}

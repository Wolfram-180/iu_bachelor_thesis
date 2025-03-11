import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iu_bachelor_thesis/stores/product_list_provider.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_button_overlay.dart';
import 'product_list.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IU Bachelor Thesis'),
        actions: const [UserSwitch()],
      ),
      body: ref
          .watch(productListProvider)
          .when(
            data:
                (products) =>
                    CartButtonOverlay(child: ProductList(products: products)),
            error: (error, _) => Center(child: Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}

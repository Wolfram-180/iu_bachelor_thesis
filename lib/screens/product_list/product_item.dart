import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/stores/store_injector.dart';
import 'package:iu_bachelor_thesis/widgets/number_picker.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final itemStore = StoreInjector.of(
      context,
    ).cartStore.cartItemStoreOfProduct(product);
    return Observer(
      builder:
          (context) => ListTile(
            title: Text('${product.title} (${product.priceAsString}\$/Item)'),
            trailing: NumberPicker(
              value: itemStore.quantity,
              onUp: itemStore.increment,
              onDown: itemStore.decrement,
            ),
          ),
    );
  }
}

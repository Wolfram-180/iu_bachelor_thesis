import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';
import 'package:iu_bachelor_thesis/widgets/number_picker.dart';

class ProductItem extends ConsumerWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context, ref) {
    final count = ref.watch(cartStoreProvider)[product.title] ?? 0;
    return ListTile(
      title: Text('${product.title} (${product.priceAsString}\$/Item)'),
      trailing: NumberPicker(
        value: count,
        onUp:
            () => ref
                .read(cartStoreProvider.notifier)
                .increaseAmountOfProduct(product),
        onDown:
            () => ref
                .read(cartStoreProvider.notifier)
                .decreaseAmountOfProduct(product),
      ),
    );
  }
}

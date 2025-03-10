import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/store/cart_store.dart';
import 'package:iu_bachelor_thesis/widgets/number_picker.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberOfProduct = context.select<CartStore, int>(
      (store) => store.amountOfProduct(product),
    );
    final cartStore = context.read<CartStore>();
    return ListTile(
      title: Text('${product.title} (${product.priceAsString}\$/Item)'),
      trailing: NumberPicker(
        value: numberOfProduct,
        onUp: () => cartStore.increaseAmount(product),
        onDown: () => cartStore.decreaseAmount(product),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/redux/actions/actions.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';
import 'package:iu_bachelor_thesis/widgets/number_picker.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder:
          (context, store) => ListTile(
            title: Text('${product.title} (${product.priceAsString}\$/Item)'),
            trailing: NumberPicker(
              value: store.state.productQuantities[product.title] ?? 0,
              onUp:
                  () =>
                      store.dispatch(IncrementProductAction(product: product)),
              onDown:
                  () =>
                      store.dispatch(DecrementProductAction(product: product)),
            ),
          ),
    );
  }
}

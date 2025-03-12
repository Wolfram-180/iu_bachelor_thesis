import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/bloc/cart_bloc.dart';
import 'package:iu_bachelor_thesis/bloc_provider.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/widgets/number_picker.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartBloc = AppState.of(context).blocProvider.cartBloc;
    return ListTile(
      title: Text('${product.title} (${product.priceAsString}\$/Item)'),
      trailing: StreamBuilder<Cart>(
        stream: cartBloc.cartStream,
        initialData: cartBloc.cart,
        builder: (context, snapshot) {
          return NumberPicker(
            value: snapshot.requireData[product] ?? 0,
            onUp:
                () => cartBloc.quantityEventSink.add(
                  IncreaseQuantityEvent(product),
                ),
            onDown:
                () => cartBloc.quantityEventSink.add(
                  DecreaseQuantityEvent(product),
                ),
          );
        },
      ),
    );
  }
}

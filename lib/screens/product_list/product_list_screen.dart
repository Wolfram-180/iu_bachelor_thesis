import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/bloc/product_bloc.dart';
import 'package:iu_bachelor_thesis/bloc_provider.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_button_overlay.dart';
import 'product_list.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = AppState.of(context).blocProvider.productBloc;
    if (productBloc.productsState.isLoading()) {
      productBloc.loadProductSink.add(const LoadProductEvent());
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('IU Bachelor Thesis'),
        actions: [UserSwitch(isOn: true, onChanged: (_) {})],
      ),
      body: StreamBuilder<ProductsState>(
        stream: productBloc.productsStateStream,
        initialData: productBloc.productsState,
        builder: (context, snapshot) {
          final state = snapshot.requireData;
          if (state.isLoaded()) {
            return CartButtonOverlay(
              child: ProductList(products: state.as<ProductsLoaded>().products),
            );
          } else if (state.hasError()) {
            return Center(child: Text(state.as<ProductsError>().errorMessage));
          } else if (state.isLoading()) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          throw UnimplementedError();
        },
      ),
    );
  }
}

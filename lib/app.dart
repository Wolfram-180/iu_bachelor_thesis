import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/bloc/cart_bloc.dart';
import 'package:iu_bachelor_thesis/bloc/product_bloc.dart';
import 'package:iu_bachelor_thesis/bloc/user_bloc.dart';
import 'package:iu_bachelor_thesis/bloc_provider.dart';
import 'package:iu_bachelor_thesis/route_key.dart';
import 'package:iu_bachelor_thesis/screens/cart/cart_screen.dart';
import 'package:iu_bachelor_thesis/screens/product_list/product_list_screen.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';
import 'package:iu_bachelor_thesis/utils/map_keys_extension.dart';

class IUBachelorThesisApp extends StatelessWidget {
  final ProductService productService;
  const IUBachelorThesisApp({super.key, required this.productService});

  BlocProvider setupBlocs() {
    final userBloc = UserBloc();
    final productBloc = ProductBloc(productService, userBloc);
    final cartBloc = CartBloc(productBloc);
    return BlocProvider(
      productBloc: productBloc,
      userBloc: userBloc,
      cartBloc: cartBloc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      blocProvider: setupBlocs(),
      child: MaterialApp(
        title: 'IU Bachelor Thesis',
        theme: ThemeData(primarySwatch: Colors.red),
        darkTheme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
        ),
        routes: {
          RouteKey.products: (context) => const ProductListScreen(),
          RouteKey.cart: (context) => const CartScreen(),
        }.mapKeys((key) => key.name),
        initialRoute: 'products',
      ),
    );
  }
}

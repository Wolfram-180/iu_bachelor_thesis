import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/route_key.dart';
import 'package:iu_bachelor_thesis/screens/cart/cart_screen.dart';
import 'package:iu_bachelor_thesis/screens/product_list/product_list_screen.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';
import 'package:iu_bachelor_thesis/store/product_store.dart';
import 'package:iu_bachelor_thesis/store/user_store.dart';
import 'package:iu_bachelor_thesis/utils/map_keys_extension.dart';

import 'store/cart_store.dart';
import 'store/product_loading_store.dart';

class IUBachelorThesisApp extends StatelessWidget {
  final ProductService productService;
  const IUBachelorThesisApp({super.key, required this.productService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserStore()),
        ProductLoadingStoreProvider(productService: productService),
        ProductStoreProvider(),
        CartStoreProvider(),
      ],
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

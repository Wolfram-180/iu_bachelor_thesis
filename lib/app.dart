import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/screens/cart/cart_screen.dart';
import 'package:iu_bachelor_thesis/screens/product_list/product_list_screen.dart';

class IUBachelorThesisApp extends StatelessWidget {
  const IUBachelorThesisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IU Bachelor Thesis',
      theme: ThemeData(primarySwatch: Colors.red),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      getPages: [
        GetPage(name: '/products', page: () => const ProductListScreen()),
        GetPage(name: '/cart', page: () => const CartScreen()),
      ],
      initialRoute: '/products',
    );
  }
}

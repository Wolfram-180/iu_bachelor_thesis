import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/screens/cart/cart_screen.dart';
import 'package:iu_bachelor_thesis/screens/product_list/product_list_screen.dart';

import 'controllers/cart_controller.dart';
import 'controllers/product_controller.dart';
import 'controllers/user_controller.dart';
import 'service/product_service.dart';

class IUBachelorThesisApp extends StatelessWidget {
  const IUBachelorThesisApp({super.key, required this.productService});

  final ProductService productService;

  void setupControllers() {
    Get.put(UserController());
    Get.put(ProductController(productService, Get.find<UserController>()));
    Get.put(CartController());
  }

  @override
  Widget build(BuildContext context) {
    setupControllers();

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

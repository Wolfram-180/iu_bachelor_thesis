import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/widgets/user_switch.dart';

import 'cart_button_overlay.dart';
import 'product_list.dart';

const _productPlaceholder = [
  Product(title: 'Bananas', price: 3),
  Product(title: 'Apples', price: 2),
  Product(title: 'Pears', price: 2.5),
  Product(title: 'Cherries', price: 1.2),
];

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const products = _productPlaceholder;
    return Scaffold(
      appBar: AppBar(
        title: const Text('IU Bachelor Thesis'),
        actions: [UserSwitch(isOn: true, onChanged: (_) {})],
      ),
      body: const CartButtonOverlay(child: ProductList(products: products)),
    );
  }
}

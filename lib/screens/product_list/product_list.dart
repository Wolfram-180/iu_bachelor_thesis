import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/models/product.dart';

import 'product_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (context, index) => ProductItem(product: products[index]),
      separatorBuilder: (context, _) => const Divider(),
    );
  }
}

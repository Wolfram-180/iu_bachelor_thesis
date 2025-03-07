import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/widgets/number_picker.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${product.title} (${product.priceAsString}\$/Item)'),
      trailing: NumberPicker(value: 5, onUp: () {}, onDown: () {}),
    );
  }
}

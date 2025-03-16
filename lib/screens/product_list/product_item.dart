import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/controllers/cart_controller.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/widgets/number_picker.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(
      builder: (cartController) {
        final int quantity = cartController.cart[product] ?? 0;
        return ListTile(
          title: Text('${product.title} (${product.priceAsString}\$/Item)'),
          trailing: NumberPicker(
            value: quantity,
            onUp: () => cartController.increaseQuantity(product),
            onDown: () => cartController.decreaseQuantity(product),
          ),
        );
      },
    );
  }
}

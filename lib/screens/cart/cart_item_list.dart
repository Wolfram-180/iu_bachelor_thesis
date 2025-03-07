import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/models/cart_item.dart';

class CartItemList extends StatelessWidget {
  final List<CartItem> items;
  const CartItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 16, height: 2.5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(),
            1: FixedColumnWidth(128),
            2: IntrinsicColumnWidth(),
          },
          children:
              items
                  .map(
                    (item) => TableRow(
                      children: [
                        Text(item.product.title),
                        Text("${item.amount}*${item.product.priceAsString}\$"),
                        Text('${item.totalPriceAsString}\$'),
                      ],
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}

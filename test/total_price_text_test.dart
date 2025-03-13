import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/src/api/observable_collections.dart';
import 'package:iu_bachelor_thesis/models/cart_item.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';
import 'package:iu_bachelor_thesis/stores/cart_item_store.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';
import 'package:iu_bachelor_thesis/stores/store_injector.dart';
import 'package:iu_bachelor_thesis/stores/user_store.dart';
import 'package:mobx/src/core.dart';

import 'cart_store_test.dart';

class MockedCartStore implements CartStore {
  @override
  int amountOfProduct(Product product) {
    throw UnimplementedError();
  }

  @override
  ObservableList<CartItem> get cart => throw UnimplementedError();

  @override
  CartItemStore cartItemStoreOfProduct(Product product) {
    throw UnimplementedError();
  }

  @override
  void decrementAmountOfProduct(Product product) {}

  @override
  void incrementAmountOfProduct(Product product) {}

  @override
  int get numberOfItems => throw UnimplementedError();

  @override
  double get totalPrice => 10.0;

  @override
  ReactiveContext get context => throw UnimplementedError();
}

void main() {
  testWidgets('test total price text', (tester) async {
    await tester.pumpWidget(
      StoreInjector(
        userStore: UserStore(),
        cartStore: MockedCartStore(),
        productStore: MockedProductStore(),
        child: const MaterialApp(home: TotalPriceText()),
      ),
    );
    expect(find.text('Total: 10.00\$'), findsOneWidget);
  });
}

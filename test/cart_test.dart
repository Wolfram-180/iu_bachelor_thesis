// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';

import 'product_service_mock.dart';

void main() {
  test('test cart store', () {
    final cartStore = CartStore();
    cartStore.increaseAmountOfProduct(demoProducts.first);
    expect(cartStore.state[demoProducts.first.title], 1);
  });
}

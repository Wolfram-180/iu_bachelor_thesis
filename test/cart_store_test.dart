import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';
import 'package:iu_bachelor_thesis/stores/product_store.dart';

import 'product_service_mock.dart';

class MockedProductStore implements ProductStore {
  @override
  void loadProducts() {}

  @override
  ObservableFuture<List<Product>> products = ObservableFuture.value(
    demoProducts,
  );

  @override
  ReactiveContext get context => throw UnimplementedError();
}

void main() {
  test('test cart store', () {
    final cartStore = CartStore(MockedProductStore());
    cartStore.incrementAmountOfProduct(demoProducts.first);
    expect(cartStore.amountOfProduct(demoProducts.first), 1);
  });
}

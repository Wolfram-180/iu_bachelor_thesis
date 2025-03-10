import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:iu_bachelor_thesis/models/remote_resource.dart';
import 'package:iu_bachelor_thesis/store/cart_store.dart';

import 'product_service_mock.dart';

void main() {
  test('test cart store', () async {
    final cartStore = CartStore();
    cartStore.updateProductList(const RemoteResource.finished(demoProducts));
    final callbackStream = StreamController();
    cartStore.addListener(() => callbackStream.add(true));
    cartStore.increaseAmount(demoProducts.first);
    expect(cartStore.amountOfProduct(demoProducts.first), 1);
    await expectLater(callbackStream.stream, emits(true));
  });
}

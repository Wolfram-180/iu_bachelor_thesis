import 'package:flutter_test/flutter_test.dart';
import 'package:iu_bachelor_thesis/redux/actions/actions.dart';
import 'package:iu_bachelor_thesis/redux/store.dart';

import 'product_service_mock.dart';

void main() {
  test('cart increment test', () {
    final store = createStore(productService: MockedProductService());
    store.dispatch(IncrementProductAction(product: demoProducts.first));
    expect(store.state.productQuantities[demoProducts.first.title], 1);
  });
}

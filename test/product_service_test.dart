import 'package:flutter_test/flutter_test.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';

void main() {
  test('test if service gets results from server', () async {
    final products = await ProductService().fetchProducts();
    expect(products.length, greaterThan(0));
    expect(products.first.price, greaterThanOrEqualTo(0));
  });
}

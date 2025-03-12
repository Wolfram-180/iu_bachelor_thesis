import 'package:flutter_test/flutter_test.dart';
import 'package:iu_bachelor_thesis/bloc/cart_bloc.dart';
import 'package:iu_bachelor_thesis/bloc/product_bloc.dart';

import 'product_service_mock.dart';

class ProductBlocMock implements ProductBloc {
  const ProductBlocMock();
  @override
  Future<void> dispose() async {}

  @override
  Sink<LoadProductEvent> get loadProductSink => throw UnimplementedError();

  @override
  final ProductsState productsState = const ProductsState.loaded(demoProducts);

  @override
  Stream<ProductsState> get productsStateStream =>
      Stream.value(productsState).asBroadcastStream();
}

void main() {
  test('test cart bloc', () async {
    const productBlocMock = ProductBlocMock();
    final cartBloc = CartBloc(productBlocMock);
    final expectedCart = {demoProducts.first: 1};
    expectLater(cartBloc.cartStream, emits(expectedCart));
    cartBloc.quantityEventSink.add(IncreaseQuantityEvent(demoProducts.first));
  });
}

import 'package:mobx/mobx.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';
import 'package:iu_bachelor_thesis/stores/user_store.dart';

part 'product_store.g.dart';

// ignore: library_private_types_in_public_api
class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  final ProductService _service;
  final UserStore _userStore;
  _ProductStore(this._service, this._userStore) : super() {
    loadProducts();
  }

  ObservableFuture<List<Product>> _products = ObservableFuture.value([]);

  @computed
  ObservableFuture<List<Product>> get products {
    if (!_userStore.isSignedIn) {
      return _products;
    }

    return _products.then(
      (products) =>
          products.map((product) => product.copyWithDiscount()).toList(),
    );
  }

  @action
  void loadProducts() {
    _products = ObservableFuture(_service.fetchProducts());
  }
}

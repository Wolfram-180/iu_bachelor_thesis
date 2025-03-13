import 'package:mobx/mobx.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';

part 'cart_item_store.g.dart';

// ignore: library_private_types_in_public_api
class CartItemStore = _CartItemStore with _$CartItemStore;

abstract class _CartItemStore with Store {
  final Product _product;
  final CartStore _store;

  _CartItemStore(this._product, this._store);

  @computed
  int get quantity => _store.amountOfProduct(_product);
  void increment() => _store.incrementAmountOfProduct(_product);
  void decrement() => _store.decrementAmountOfProduct(_product);
}

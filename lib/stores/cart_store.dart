import 'package:mobx/mobx.dart';
import 'package:iu_bachelor_thesis/models/cart_item.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/stores/cart_item_store.dart';
import 'package:iu_bachelor_thesis/stores/product_store.dart';

part 'cart_store.g.dart';

// ignore: library_private_types_in_public_api
class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  final ProductStore _productStore;
  @observable
  // ignore: prefer_final_fields
  ObservableMap<String, int> _productQuantities = ObservableMap();

  _CartStore(this._productStore);

  @computed
  ObservableList<CartItem> get cart {
    final products = _productStore.products.value ?? <Product>[];
    final productsByTitle = {
      for (final product in products) product.title: product,
    };
    final items = _productQuantities.entries
        .where((pair) => productsByTitle.containsKey(pair.key))
        .map(
          (pair) =>
              CartItem(product: productsByTitle[pair.key]!, amount: pair.value),
        );
    return ObservableList.of(items);
  }

  @computed
  int get numberOfItems => cart.length;

  @computed
  double get totalPrice => cart.fold(
    0.0,
    (previousValue, element) =>
        previousValue + element.amount * element.product.price,
  );

  @action
  void _changeAmountOfProduct(Product product, int amount) {
    final oldValue = _productQuantities.putIfAbsent(product.title, () => 0);
    final newValue = oldValue + amount;
    if (newValue <= 0) {
      _productQuantities.remove(product.title);
      return;
    }
    _productQuantities[product.title] = newValue;
  }

  void incrementAmountOfProduct(Product product) =>
      _changeAmountOfProduct(product, 1);
  void decrementAmountOfProduct(Product product) =>
      _changeAmountOfProduct(product, -1);

  int amountOfProduct(Product product) =>
      _productQuantities[product.title] ?? 0;

  CartItemStore cartItemStoreOfProduct(Product product) =>
      CartItemStore(product, this as CartStore);
}

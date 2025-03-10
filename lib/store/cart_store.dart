import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/models/cart_item.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/models/remote_resource.dart';
import 'package:iu_bachelor_thesis/store/product_store.dart';

class CartStore extends ChangeNotifier {
  List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  int get numberOfProducts => _cart.length;
  double get totalPrice => _cart.fold<double>(
    0.0,
    (value, item) => value + item.product.price * item.amount,
  );

  int amountOfProduct(Product product) =>
      cart
          .firstWhere(
            (item) => product == item.product,
            orElse: () => CartItem(product: product, amount: 0),
          )
          .amount;

  void updateProductList(RemoteResource<List<Product>> remoteProducts) {
    if (remoteProducts is LoadingRemoteResource) {
      return;
    }
    late final List<Product> products;
    if (remoteProducts is ErrorRemoteResource) {
      products = [];
    } else {
      products = remoteProducts.asFinished().value;
    }
    final productsByKey = {
      for (final product in products) product.title: product,
    };
    _cart =
        _cart
            .where((item) => productsByKey.containsKey(item.product.title))
            .map(
              (item) => CartItem(
                product: productsByKey[item.product.title]!,
                amount: item.amount,
              ),
            )
            .toList();
    notifyListeners();
  }

  void _addAmount(Product product, int amount) {
    final old = _cart.cast<CartItem?>().firstWhere(
      (item) => item?.product.title == product.title,
      orElse: () => null,
    );
    if (old == null) {
      if (amount <= 0) return;
      _cart = _cart..add(CartItem(product: product, amount: amount));
      notifyListeners();
      return;
    }
    if (old.amount + amount < 0) return;
    final newItem = CartItem(product: product, amount: old.amount + amount);
    _cart =
        _cart
            .map((item) => item.product.title == product.title ? newItem : item)
            .toList();
    notifyListeners();
  }

  void increaseAmount(Product product) => _addAmount(product, 1);
  void decreaseAmount(Product product) => _addAmount(product, -1);
}

class CartStoreProvider
    extends ChangeNotifierProxyProvider<ProductStore, CartStore> {
  CartStoreProvider({Key? key, Widget? child})
    : super(
        key: key,
        child: child,
        create: (context) => CartStore(),
        update:
            (context, productStore, cartStore) =>
                cartStore!..updateProductList(productStore.products),
      );
}

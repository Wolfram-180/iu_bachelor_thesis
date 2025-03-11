import 'package:riverpod/riverpod.dart';
import 'package:iu_bachelor_thesis/models/cart_item.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/stores/product_list_provider.dart';

class CartStore extends StateNotifier<Map<String, int>> {
  CartStore() : super({});

  void _addAmountOfProduct(Product product, int amount) {
    final value = state[product.title] ?? 0;
    if (value + amount < 0) {
      return;
    } else if (value + amount == 0) {
      state.remove(product.title);
      state = {...state};
      return;
    }
    state = {...state, product.title: value + amount};
  }

  void increaseAmountOfProduct(Product product) =>
      _addAmountOfProduct(product, 1);
  void decreaseAmountOfProduct(Product product) =>
      _addAmountOfProduct(product, -1);
}

final totalProductInCartCountProvider = Provider(
  (ref) => ref.watch(cartItemListProvider).length,
  dependencies: [cartItemListProvider],
);

final totalPriceProvider = Provider(
  (ref) => ref
      .watch(cartItemListProvider)
      .fold<double>(
        0.0,
        (previousValue, element) =>
            previousValue + element.amount * element.product.price,
      ),
  dependencies: [cartItemListProvider],
);

final cartStoreProvider = StateNotifierProvider<CartStore, Map<String, int>>(
  (ref) => CartStore(),
);

final cartItemListProvider = Provider((ref) {
  final cart = ref.watch(cartStoreProvider);
  final productsByTitle = ref
      .watch(productListProvider)
      .whenOrNull(
        data:
            (products) => {
              for (final product in products) product.title: product,
            },
      );
  if (productsByTitle == null) return <CartItem>[];
  return cart.entries
      .where((entry) => productsByTitle.containsKey(entry.key))
      .map(
        (entry) =>
            CartItem(product: productsByTitle[entry.key]!, amount: entry.value),
      )
      .toList();
}, dependencies: [cartStoreProvider, productListProvider]);

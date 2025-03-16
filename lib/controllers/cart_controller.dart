import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/models/cart_item.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/models/products_state.dart';
import 'product_controller.dart';

class CartController extends GetxController {
  final _cart = <Product, int>{}.obs;
  final _totalPrice = 0.0.obs;
  final _numberOfProducts = 0.obs;

  RxMap<Product, int> get cart => _cart;
  RxDouble get totalPrice => _totalPrice;
  RxInt get numberOfProducts => _numberOfProducts;

  @override
  void onInit() {
    super.onInit();
    final productController = Get.find<ProductController>();
    ever(productController.productsState, (_) => _updatePrices());
  }

  void increaseQuantity(Product product) {
    _cart[product] = (_cart[product] ?? 0) + 1;
    _updateCart();
  }

  void decreaseQuantity(Product product) {
    if (_cart.containsKey(product) && _cart[product]! > 0) {
      _cart[product] = _cart[product]! - 1;
      if (_cart[product] == 0) {
        _cart.remove(product);
      }
      _updateCart();
    }
  }

  void _updateCart() {
    _totalPrice.value = _cart.entries.fold(
      0.0,
      (sum, entry) => sum + entry.key.price * entry.value,
    );
    _numberOfProducts.value = _cart.length;
  }

  List<CartItem> toCartItems() =>
      _cart.entries
          .map((entry) => CartItem(product: entry.key, amount: entry.value))
          .toList();

  void _updatePrices() {
    final productController = Get.find<ProductController>();
    final updatedCart = <Product, int>{};

    final state = productController.productsState.value;
    if (state is ProductsLoaded) {
      for (final entry in _cart.entries) {
        final updatedProduct = state.products.firstWhereOrNull(
          (product) => product.title == entry.key.title,
        );
        if (updatedProduct != null) {
          updatedCart[updatedProduct] = entry.value;
        }
      }

      _cart.value = updatedCart;
      _updateCart();
    }
  }
}

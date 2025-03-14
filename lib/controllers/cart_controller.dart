import 'package:get/get.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import 'product_controller.dart';

class CartController extends GetxController {
  final RxMap<String, int> cartItems = <String, int>{}.obs;

  void addToCart(Product product) {
    final currentCount = cartItems[product.title] ?? 0;
    cartItems[product.title] = currentCount + 1;
  }

  void removeFromCart(Product product) {
    final currentCount = cartItems[product.title] ?? 0;
    if (currentCount <= 1) {
      cartItems.remove(product.title);
    } else {
      cartItems[product.title] = currentCount - 1;
    }
  }

  int getCount(Product product) => cartItems[product.title] ?? 0;

  double get totalPrice {
    final productController = Get.find<ProductController>();
    double total = 0;
    cartItems.forEach((title, count) {
      final product = productController.products.firstWhere(
        (p) => p.title == title,
      );
      total += product.price * count;
    });
    return total;
  }

  int get totalItems => cartItems.values.fold(0, (sum, count) => sum + count);

  List<CartItem> get cartItemsList {
    final productController = Get.find<ProductController>();
    return cartItems.entries.map((entry) {
      final product = productController.products.firstWhere(
        (p) => p.title == entry.key,
      );
      return CartItem(product: product, amount: entry.value);
    }).toList();
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/controllers/cart_controller.dart';
import 'package:iu_bachelor_thesis/controllers/product_controller.dart';
import 'package:iu_bachelor_thesis/controllers/user_controller.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/models/products_state.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';

void main() {
  late CartController cartController;
  late ProductController productController;
  late Product apples;
  late Product pears;

  setUp(() {
    Get.reset();
    apples = Product(title: 'Apples', price: 0.99);
    pears = Product(title: 'Pears', price: 1.99);
    final userController = UserController();
    final productService = ProductService();
    productController = ProductController(productService, userController);
    Get.put(productController);
    cartController = CartController();
    Get.put(cartController);
  });

  group('CartController Tests with Fruits', () {
    test('Success! Initial cart state is empty', () {
      expect(cartController.cart.isEmpty, true);
      expect(cartController.totalPrice.value, 0.0);
      expect(cartController.numberOfProducts.value, 0);
    });

    test('Success! Adding apples to cart', () {
      cartController.increaseQuantity(apples);

      expect(cartController.cart[apples], 1);
      expect(cartController.totalPrice.value, 0.99);
      expect(cartController.numberOfProducts.value, 1);
    });

    test('Success! Adding multiple fruits', () {
      cartController.increaseQuantity(apples);
      cartController.increaseQuantity(apples);
      cartController.increaseQuantity(pears);

      expect(cartController.cart[apples], 2);
      expect(cartController.cart[pears], 1);
      expect(cartController.totalPrice.value, closeTo(3.97, 0.01));
      expect(cartController.numberOfProducts.value, 2);
    });

    test('Success! Removing fruits from cart', () {
      cartController.increaseQuantity(apples);
      cartController.increaseQuantity(pears);
      cartController.decreaseQuantity(apples);

      expect(cartController.cart.containsKey(apples), false);
      expect(cartController.cart[pears], 1);
      expect(cartController.totalPrice.value, closeTo(1.99, 0.01));
      expect(cartController.numberOfProducts.value, 1);
    });

    test('Success! Cart items conversion test', () {
      cartController.increaseQuantity(apples);
      cartController.increaseQuantity(apples);
      cartController.increaseQuantity(pears);

      final cartItems = cartController.toCartItems();

      expect(cartItems.length, 2);

      final applesItem = cartItems.firstWhere(
        (item) => item.product.title == 'Apples',
      );
      expect(applesItem.amount, 2);
      expect(applesItem.product.price, 0.99);

      final pearsItem = cartItems.firstWhere(
        (item) => item.product.title == 'Pears',
      );
      expect(pearsItem.amount, 1);
      expect(pearsItem.product.price, 1.99);
    });

    test('Success! Price updates when products state changes', () {
      cartController.increaseQuantity(apples);
      final updatedApples = Product(title: 'Apples', price: 1.29);

      productController.productsState.value = ProductsLoaded([
        updatedApples,
        pears,
      ]);
      expect(cartController.totalPrice.value, closeTo(1.29, 0.01));
    });

    test('Success! Adding maximum quantity of fruits', () {
      for (var i = 0; i < 10; i++) {
        cartController.increaseQuantity(apples);
        cartController.increaseQuantity(pears);
      }

      expect(cartController.cart[apples], 10);
      expect(cartController.cart[pears], 10);
      expect(cartController.totalPrice.value, closeTo(29.80, 0.01));
      expect(cartController.numberOfProducts.value, 2);
    });
  });
}

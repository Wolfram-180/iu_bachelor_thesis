import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/controllers/cart_controller.dart';
import 'package:iu_bachelor_thesis/controllers/product_controller.dart';
import 'package:iu_bachelor_thesis/controllers/user_controller.dart';
import 'package:iu_bachelor_thesis/screens/product_list/cart_button.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';

void main() {
  late CartController cartController;
  late ProductController productController;
  late UserController userController;
  late ProductService productService;

  setUp(() {
    Get.reset();

    userController = UserController();
    Get.put(userController);

    productService = ProductService();
    productController = ProductController(productService, userController);
    Get.put(productController);

    cartController = CartController();
    Get.put(cartController);
  });

  testWidgets(
    'Success! CartButton is displayed correctly and responds to changes',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(home: Scaffold(body: CartButton())),
      );

      expect(find.byKey(const Key('cart_button')), findsOneWidget);
      expect(find.text('Cart (0 Items)'), findsOneWidget);

      cartController.numberOfProducts.value = 2;
      await tester.pump();

      expect(find.text('Cart (2 Items)'), findsOneWidget);

      expect(find.byIcon(Icons.shopping_basket), findsOneWidget);
    },
  );

  testWidgets('Success! CartButton calls navigation when pressed', (
    WidgetTester tester,
  ) async {
    bool navigationCalled = false;

    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(body: CartButton()),
        getPages: [
          GetPage(
            name: '/cart',
            page: () {
              navigationCalled = true;
              return Container();
            },
          ),
        ],
      ),
    );

    await tester.tap(find.byKey(const Key('cart_button')));
    await tester.pumpAndSettle();

    expect(navigationCalled, true);
  });
}

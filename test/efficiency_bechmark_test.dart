// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iu_bachelor_thesis/app.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';

import 'product_service_mock.dart';

void main() {
  testWidgets('Efficiency test', (WidgetTester tester) async {
    await tester.pumpWidget(
      IUBachelorThesisApp(productService: MockedProductService()),
    );
    await tester.pumpAndSettle(const Duration(seconds: 2));
    final addIcons = find.byIcon(Icons.add);
    expect(addIcons, findsWidgets);
    // click at the first and last one 2 times
    await tester.tap(addIcons.first);
    await tester.pumpAndSettle();
    await tester.tap(addIcons.first);
    await tester.pumpAndSettle();
    await tester.tap(addIcons.last);
    await tester.pumpAndSettle();
    await tester.tap(addIcons.last);
    await tester.pumpAndSettle();

    // click on the first remove icon
    final removeIcons = find.byIcon(Icons.remove);
    await tester.tap(removeIcons.first);
    await tester.pumpAndSettle();

    // toggle sign in button two times
    final switchButton = find.byKey(const Key('user_switch'));
    await tester.tap(switchButton);
    await tester.pumpAndSettle();
    await tester.tap(switchButton);
    await tester.pumpAndSettle();

    // go to cart
    final cartButton = find.byKey(const Key('cart_button'));
    await tester.tap(cartButton);
    await tester.pumpAndSettle();
    final header = find.text('Cart');
    expect(header, findsOneWidget);

    print("cartButton: ${BenchmarkCounters.cartButton}");
    print("userSwitch: ${BenchmarkCounters.userSwitch}");
  });
}

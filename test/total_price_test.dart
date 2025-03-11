import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';

void main() {
  testWidgets('test total price widget', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [totalPriceProvider.overrideWithValue(10.0)],
          child: const TotalPriceText(),
        ),
      ),
    );
    expect(find.text('Total: 10.00\$'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iu_bachelor_thesis/bloc/cart_bloc.dart';
import 'package:iu_bachelor_thesis/bloc/product_bloc.dart';
import 'package:iu_bachelor_thesis/bloc/user_bloc.dart';
import 'package:iu_bachelor_thesis/bloc_provider.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';

import 'product_service_mock.dart';

class CartBlocMock implements CartBloc {
  @override
  Stream<int> numberOfProductsStream = const Stream.empty();

  @override
  Cart get cart => throw UnimplementedError();

  @override
  Stream<Cart> get cartStream => throw UnimplementedError();

  @override
  Future<void> dispose() async {}

  @override
  final int numberOfProducts = 1;

  @override
  Sink<ChangeQuantityEvent> get quantityEventSink => throw UnimplementedError();

  @override
  double get totalPrice => 10.00;

  @override
  Stream<double> get totalPriceStream => Stream.value(totalPrice);
}

void main() {
  testWidgets('test total price widget', (tester) async {
    final blocProvider = BlocProvider(
      userBloc: UserBloc(),
      productBloc: ProductBloc(MockedProductService(), UserBloc()),
      cartBloc: CartBlocMock(),
    );
    final appStateWithTotalPrice = AppState(
      blocProvider: blocProvider,
      child: const MaterialApp(home: TotalPriceText()),
    );
    await tester.pumpWidget(appStateWithTotalPrice);
    expect(find.text("Total: 10.00\$"), findsOneWidget);
  });
}

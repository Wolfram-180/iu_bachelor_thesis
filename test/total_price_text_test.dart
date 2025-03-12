import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:iu_bachelor_thesis/models/remote_resource.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';
import 'package:iu_bachelor_thesis/screens/cart/total_price_text.dart';

class AppStateMock extends AppState {
  AppStateMock()
    : super(
        isSignedIn: false,
        remoteProducts: const RemoteResource.loading(),
        productQuantities: {},
      );
  @override
  double get totalPrice => 10.0;
}

void main() {
  testWidgets('test total price text', (tester) async {
    final store = Store<AppState>((s, _) => s, initialState: AppStateMock());
    await tester.pumpWidget(
      MaterialApp(
        home: StoreProvider<AppState>(
          store: store,
          child: const TotalPriceText(),
        ),
      ),
    );
    expect(find.text('Total: 10.00\$'), findsOneWidget);
  });
}

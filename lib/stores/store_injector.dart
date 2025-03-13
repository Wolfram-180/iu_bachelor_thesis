import 'package:flutter/widgets.dart';
import 'package:iu_bachelor_thesis/stores/cart_store.dart';
import 'package:iu_bachelor_thesis/stores/product_store.dart';
import 'package:iu_bachelor_thesis/stores/user_store.dart';

class StoreInjector extends InheritedWidget {
  final UserStore userStore;
  final CartStore cartStore;
  final ProductStore productStore;

  const StoreInjector({
    super.key,
    required this.userStore,
    required this.cartStore,
    required this.productStore,
    required super.child,
  });

  static StoreInjector of(BuildContext context) {
    final StoreInjector? result =
        context.dependOnInheritedWidgetOfExactType<StoreInjector>();
    assert(result != null, 'No StoreInjector found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(StoreInjector oldWidget) {
    return false;
  }
}

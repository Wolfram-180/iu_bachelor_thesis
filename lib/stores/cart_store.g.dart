// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  Computed<ObservableList<CartItem>>? _$cartComputed;

  @override
  ObservableList<CartItem> get cart =>
      (_$cartComputed ??= Computed<ObservableList<CartItem>>(() => super.cart,
              name: '_CartStore.cart'))
          .value;
  Computed<int>? _$numberOfItemsComputed;

  @override
  int get numberOfItems =>
      (_$numberOfItemsComputed ??= Computed<int>(() => super.numberOfItems,
              name: '_CartStore.numberOfItems'))
          .value;
  Computed<double>? _$totalPriceComputed;

  @override
  double get totalPrice =>
      (_$totalPriceComputed ??= Computed<double>(() => super.totalPrice,
              name: '_CartStore.totalPrice'))
          .value;

  late final _$_productQuantitiesAtom =
      Atom(name: '_CartStore._productQuantities', context: context);

  @override
  ObservableMap<String, int> get _productQuantities {
    _$_productQuantitiesAtom.reportRead();
    return super._productQuantities;
  }

  @override
  set _productQuantities(ObservableMap<String, int> value) {
    _$_productQuantitiesAtom.reportWrite(value, super._productQuantities, () {
      super._productQuantities = value;
    });
  }

  late final _$_CartStoreActionController =
      ActionController(name: '_CartStore', context: context);

  @override
  void _changeAmountOfProduct(Product product, int amount) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore._changeAmountOfProduct');
    try {
      return super._changeAmountOfProduct(product, amount);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart},
numberOfItems: ${numberOfItems},
totalPrice: ${totalPrice}
    ''';
  }
}

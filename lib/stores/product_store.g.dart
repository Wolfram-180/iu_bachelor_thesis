// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on _ProductStore, Store {
  Computed<ObservableFuture<List<Product>>>? _$productsComputed;

  @override
  ObservableFuture<List<Product>> get products => (_$productsComputed ??=
          Computed<ObservableFuture<List<Product>>>(() => super.products,
              name: '_ProductStore.products'))
      .value;

  late final _$_ProductStoreActionController =
      ActionController(name: '_ProductStore', context: context);

  @override
  void loadProducts() {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.loadProducts');
    try {
      return super.loadProducts();
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}

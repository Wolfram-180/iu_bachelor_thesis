// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartItemStore on _CartItemStore, Store {
  Computed<int>? _$quantityComputed;

  @override
  int get quantity => (_$quantityComputed ??=
          Computed<int>(() => super.quantity, name: '_CartItemStore.quantity'))
      .value;

  @override
  String toString() {
    return '''
quantity: ${quantity}
    ''';
  }
}

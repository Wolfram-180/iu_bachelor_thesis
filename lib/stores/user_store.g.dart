// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$isSignedInAtom =
      Atom(name: '_UserStore.isSignedIn', context: context);

  @override
  bool get isSignedIn {
    _$isSignedInAtom.reportRead();
    return super.isSignedIn;
  }

  @override
  set isSignedIn(bool value) {
    _$isSignedInAtom.reportWrite(value, super.isSignedIn, () {
      super.isSignedIn = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void logIn() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.logIn');
    try {
      return super.logIn();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logOut() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.logOut');
    try {
      return super.logOut();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSignedIn: ${isSignedIn}
    ''';
  }
}

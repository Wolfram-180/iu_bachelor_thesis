import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  bool isSignedIn = false;

  @action
  void logIn() {
    isSignedIn = true;
  }

  @action
  void logOut() {
    isSignedIn = false;
  }
}

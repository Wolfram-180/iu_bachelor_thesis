import 'package:riverpod/riverpod.dart';

class UserStore extends StateNotifier<bool> {
  UserStore({bool initialSignInStatus = false}) : super(initialSignInStatus);

  void changeSignInStatus(bool newStatus) {
    state = newStatus;
  }
}

final userStoreProvider = StateNotifierProvider<UserStore, bool>(
  (ref) => UserStore(),
);

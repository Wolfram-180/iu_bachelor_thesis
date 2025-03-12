import 'package:redux/redux.dart';
import 'package:iu_bachelor_thesis/redux/actions/actions.dart';

final userReducer = combineReducers<bool>([
  TypedReducer<bool, SingInAction>(_signIn).call,
  TypedReducer<bool, SignOutAction>(_signOut).call,
]);

bool _signIn(bool old, SingInAction action) {
  return true;
}

bool _signOut(bool old, SignOutAction action) {
  return false;
}

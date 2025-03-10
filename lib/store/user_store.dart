import 'package:flutter/foundation.dart';

class UserStore extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  void changeSignIn(bool newValue) {
    _isSignedIn = newValue;
    notifyListeners();
  }
}

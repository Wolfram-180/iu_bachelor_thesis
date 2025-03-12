import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:iu_bachelor_thesis/utils/disposable.dart';

@immutable
class UserEvent {
  final bool isSignedIn;

  const UserEvent({required this.isSignedIn});
}

class UserBloc implements Disposable {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  final _isSignedInController = StreamController<bool>.broadcast();
  Stream<bool> get isSignedInStream => _isSignedInController.stream;

  final _userEventController = StreamController<UserEvent>.broadcast();
  Sink<UserEvent> get userEventSink => _userEventController.sink;

  UserBloc() {
    _userEventController.stream.listen(_handleEvent);
  }

  void _handleEvent(UserEvent event) {
    _isSignedIn = event.isSignedIn;
    _isSignedInController.add(event.isSignedIn);
  }

  @override
  Future<void> dispose() async {
    await _isSignedInController.close();
    await _userEventController.close();
  }
}

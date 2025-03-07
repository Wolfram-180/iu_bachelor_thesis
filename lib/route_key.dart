import 'package:flutter/widgets.dart';

enum RouteKey { products, cart }

extension NavigatorHelper on NavigatorState {
  pushRouteKey(RouteKey key) => pushNamed(key.name);
}

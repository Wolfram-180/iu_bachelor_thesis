import 'package:flutter/widgets.dart';
import 'package:iu_bachelor_thesis/bloc/cart_bloc.dart';
import 'package:iu_bachelor_thesis/bloc/product_bloc.dart';
import 'package:iu_bachelor_thesis/bloc/user_bloc.dart';

import 'utils/disposable.dart';

class BlocProvider implements Disposable {
  final UserBloc userBloc;
  final ProductBloc productBloc;
  final CartBloc cartBloc;

  const BlocProvider({
    required this.userBloc,
    required this.productBloc,
    required this.cartBloc,
  });

  @override
  Future<void> dispose() async {
    await Future.wait<void>([
      cartBloc.dispose(),
      productBloc.dispose(),
      userBloc.dispose(),
    ]);
  }
}

class AppState extends StatefulWidget {
  final Widget child;
  final BlocProvider blocProvider;
  const AppState({super.key, required this.blocProvider, required this.child});

  static AppState of(BuildContext context) {
    final AppState? state = context.findAncestorWidgetOfExactType();
    if (state == null) {
      throw Exception("AppState is not an ancestor of this widget");
    }
    return state;
  }

  @override
  // ignore: library_private_types_in_public_api
  _AppStateState createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.blocProvider.dispose();
    super.dispose();
  }
}

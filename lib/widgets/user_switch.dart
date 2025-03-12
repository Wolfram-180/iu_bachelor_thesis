import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/redux/actions/actions.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';

class UserSwitch extends StatelessWidget {
  final bool isOn;
  final ValueChanged<bool> onChanged;
  const UserSwitch({required this.isOn, required this.onChanged})
    : super(key: const Key('user_switch'));

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context, store) {
        BenchmarkCounters.userSwitch++;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.account_circle),
            Switch(
              value: store.state.isSignedIn,
              onChanged:
                  (newState) => store.dispatch(
                    newState ? SingInAction() : SignOutAction(),
                  ),
              activeColor: Colors.green,
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/store/user_store.dart';

class UserSwitch extends StatelessWidget {
  const UserSwitch() : super(key: const Key('user_switch'));

  @override
  Widget build(BuildContext context) {
    final userStore = context.watch<UserStore>();
    BenchmarkCounters.userSwitch++;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.account_circle),
        Switch(
          value: userStore.isSignedIn,
          onChanged: userStore.changeSignIn,
          activeColor: Colors.green,
        ),
      ],
    );
  }
}

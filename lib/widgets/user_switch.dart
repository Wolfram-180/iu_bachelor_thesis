import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/stores/store_injector.dart';

class UserSwitch extends StatelessWidget {
  const UserSwitch() : super(key: const Key('user_switch'));

  @override
  Widget build(BuildContext context) {
    final userStore = StoreInjector.of(context).userStore;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.account_circle),
        Observer(
          builder: (context) {
            BenchmarkCounters.userSwitch++;
            return Switch(
              value: userStore.isSignedIn,
              onChanged:
                  (shouldSignIn) =>
                      shouldSignIn ? userStore.logIn() : userStore.logOut(),
              activeColor: Colors.green,
            );
          },
        ),
      ],
    );
  }
}

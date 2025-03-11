import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/stores/user_store.dart';

class UserSwitch extends ConsumerWidget {
  const UserSwitch() : super(key: const Key('user_switch'));

  @override
  Widget build(BuildContext context, ref) {
    final isSignedIn = ref.watch(userStoreProvider);
    BenchmarkCounters.userSwitch++;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.account_circle),
        Switch(
          value: isSignedIn,
          onChanged: ref.read(userStoreProvider.notifier).changeSignInStatus,
          activeColor: Colors.green,
        ),
      ],
    );
  }
}

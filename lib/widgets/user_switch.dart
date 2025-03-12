import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';
import 'package:iu_bachelor_thesis/bloc/user_bloc.dart';
import 'package:iu_bachelor_thesis/bloc_provider.dart';

class UserSwitch extends StatelessWidget {
  final bool isOn;
  final ValueChanged<bool> onChanged;
  const UserSwitch({required this.isOn, required this.onChanged})
    : super(key: const Key('user_switch'));

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = AppState.of(context).blocProvider.userBloc;
    return StreamBuilder<bool>(
      stream: userBloc.isSignedInStream,
      initialData: userBloc.isSignedIn,
      builder: (context, snapshot) {
        BenchmarkCounters.userSwitch++;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.account_circle),
            Switch(
              value: snapshot.data ?? false,
              onChanged:
                  (newValue) => userBloc.userEventSink.add(
                    UserEvent(isSignedIn: newValue),
                  ),
              activeColor: Colors.green,
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/benchmark_counter.dart';

class UserSwitch extends StatelessWidget {
  final bool isOn;
  final ValueChanged<bool> onChanged;
  const UserSwitch({required this.isOn, required this.onChanged})
    : super(key: const Key('user_switch'));

  @override
  Widget build(BuildContext context) {
    BenchmarkCounters.userSwitch++;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.account_circle),
        Switch(value: isOn, onChanged: onChanged, activeColor: Colors.green),
      ],
    );
  }
}

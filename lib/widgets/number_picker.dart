import 'package:flutter/material.dart';

class NumberPicker extends StatelessWidget {
  final int value;
  final VoidCallback onUp;
  final VoidCallback onDown;
  final int minValue;
  final int maxValue;
  const NumberPicker({
    super.key,
    required this.value,
    required this.onUp,
    required this.onDown,
    this.minValue = 0,
    this.maxValue = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ConditionalIconButton(
          enabled: value > minValue,
          onClick: onDown,
          iconData: Icons.remove,
        ),
        Text(value.toString()),
        _ConditionalIconButton(
          enabled: value < maxValue,
          onClick: onUp,
          iconData: Icons.add,
        ),
      ],
    );
  }
}

class _ConditionalIconButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onClick;
  final IconData iconData;
  const _ConditionalIconButton({
    required this.enabled,
    required this.onClick,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled ? onClick : null,
      icon: Icon(iconData),
    );
  }
}

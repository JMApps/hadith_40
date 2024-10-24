import 'package:flutter/material.dart';

class AppSettingSwitch extends StatelessWidget {
  const AppSettingSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      activeColor: Theme.of(context).colorScheme.inversePrimary,
      value: value,
      onChanged: onChanged,
    );
  }
}

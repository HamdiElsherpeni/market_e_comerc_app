import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const SwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: Colors.blue,
          inactiveThumbColor: Colors.grey,
        ),
      ),
    );
  }
}

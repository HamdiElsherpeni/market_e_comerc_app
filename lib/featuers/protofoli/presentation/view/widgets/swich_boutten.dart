import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const SwitchButton({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
          inactiveThumbColor: Colors.grey,
        ),
      ),
    );
  }
}

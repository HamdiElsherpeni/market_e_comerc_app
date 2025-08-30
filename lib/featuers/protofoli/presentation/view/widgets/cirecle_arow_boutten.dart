import 'package:flutter/material.dart';

class CircleArrowButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CircleArrowButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue.shade200, width: 0.5), // الحدود
      ),
      child: IconButton(
        icon: const Icon(
          Icons.chevron_right,
          color: Colors.blue,
          size: 10,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

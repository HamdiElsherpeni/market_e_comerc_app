import 'package:flutter/material.dart';

class CoustemIndecator extends StatelessWidget {
  const CoustemIndecator({super.key, required this.active});
  final bool active;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(180),
        color: active ? const Color.fromARGB(255, 6, 41, 70) : Colors.blue[100],
      ),
      width: active? 15:13,
      height:  active? 15:13,
    );
  }
}

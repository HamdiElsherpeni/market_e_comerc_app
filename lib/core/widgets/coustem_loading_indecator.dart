import 'package:flutter/material.dart';

class CoustemLoadingIndecator extends StatelessWidget {
  const CoustemLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
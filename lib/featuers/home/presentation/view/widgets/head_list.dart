import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_styls.dart';

class HeadList extends StatelessWidget {
  const HeadList({super.key, required this.headName, this.onPressed});
  final String headName;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headName, style: AppStyls.textStyle17),
        TextButton(
          onPressed: onPressed ?? () {},
          child: Text('View all', style: AppStyls.textStyle12),
        ),
      ],
    );
  }
}

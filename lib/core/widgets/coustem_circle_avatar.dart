import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/constant.dart';

class CoustemCircleAvatar extends StatelessWidget {
  const CoustemCircleAvatar({super.key, required this.icon, this.onPressed});
  final Icon icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 21,
      backgroundColor: Colors.blue.withOpacity(.5),
      child: CircleAvatar(
        radius: 20.55,

        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: IconButton(
          onPressed: onPressed ?? () {},
          icon: icon,
          color: KprimaryColor,
        ),
      ),
    );
  }
}

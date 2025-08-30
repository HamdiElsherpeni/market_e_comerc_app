import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_avatar.dart';

class CoutemAppBarForget extends StatelessWidget {
  const CoutemAppBarForget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CoustemCircleAvatar(
          icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        SizedBox(width: 20),
        Text('Forget Password'),
      ],
    );
  }
}

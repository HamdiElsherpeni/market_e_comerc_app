import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_styls.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_avatar.dart';

class CoustemAbbBarMyProfile extends StatelessWidget {
  const CoustemAbbBarMyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CoustemCircleAvatar(
          icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        SizedBox(width: 20),
        Text("My Profile", style: AppStyls.textStyle17),
        SizedBox(width: 20),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.KCartPage);
          },
          icon: Icon(Icons.shopping_cart_outlined, color: KprimaryColor),
        ),
      ],
    );
  }
}

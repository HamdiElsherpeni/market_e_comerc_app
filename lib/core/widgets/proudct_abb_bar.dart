import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_styls.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_avatar.dart';
import "package:flutter/material.dart";
import 'package:market_e_comerc_app/core/widgets/coustem_circle_image.dart';

class ProudctAbbBar extends StatelessWidget {
  const ProudctAbbBar({super.key, this.urlImage, required this.titel});
  final String? urlImage;
  final String titel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CoustemCircleAvatar(
          icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.KHomeView);
          },
        ),
        SizedBox(width: 20),
        Text("$titel", style: AppStyls.textStyle17),
        SizedBox(width: 20),
        CoustemCircleImage(urlImage: urlImage ?? AppAssets.hamdi),
      ],
    );
  }
}

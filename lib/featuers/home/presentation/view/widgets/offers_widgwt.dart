import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/function/app_assets.dart';

class OffersWidgwt extends StatelessWidget {
  const OffersWidgwt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width*0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(AppAssets.offers),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

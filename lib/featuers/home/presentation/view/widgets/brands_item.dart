import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';

class BrandsItem extends StatelessWidget {
  const BrandsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color.fromARGB(255, 153, 171, 242).withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(child: Image.asset(AppAssets.forgetPass)),
        ),
      ],
    );
  }
}

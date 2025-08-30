import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_styls.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          Container(
            height: 90,
            width: 100,

            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color.fromARGB(255, 153, 171, 242).withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              child: Center(
                child: Image.asset(
                  AppAssets.hamdi,

                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            'Pampers',
            style: AppStyls.textStyle17.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

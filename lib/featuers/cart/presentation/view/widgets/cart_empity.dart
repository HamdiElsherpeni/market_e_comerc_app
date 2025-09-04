import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_styls.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';

class CartEmpity extends StatelessWidget {
  const CartEmpity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              ProudctAbbBar(titel: "Cart"),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 180,
                      child: Image.asset(AppAssets.emptyCarrt),
                    ),
                    SizedBox(height: 10),
                    Text('Your Cart is Empty', style: AppStyls.textStyle17),
                    SizedBox(height: 10),
                    Text(
                      'Check our big offers, fresh products\nand fill your cart with items',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),

                    CoustemElvetedBoutten(
                      text: "Start Shopping",
                      onPressed: () {
                        GoRouter.of(
                          context,
                        ).pushReplacement(AppRouter.KHomeView);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

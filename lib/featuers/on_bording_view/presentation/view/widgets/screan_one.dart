import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/coustem_indecator.dart';

class ScreanOne extends StatelessWidget {
  const ScreanOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Image.asset(AppAssets.onbording3),
        ),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoustemIndecator(active: true),
            SizedBox(width: 5),
            CoustemIndecator(active: false),
            SizedBox(width: 5),

            CoustemIndecator(active: false),
          ],
        ),
        SizedBox(height: 20),

        Text(
          'Welcome to Marketi',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 30),
        Text(
          'Discover a world of endless\npossibilities and shop from \nthe comfort of your fingertips \nBrowse through a wide range \nof products, from \nfashion and electronics to home.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

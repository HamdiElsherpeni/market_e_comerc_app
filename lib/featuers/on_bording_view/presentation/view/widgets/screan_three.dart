import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/function/app_assets.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/coustem_indecator.dart';

class ScreanThree extends StatelessWidget {
  const ScreanThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Image.asset(AppAssets.onbording1),
        ),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoustemIndecator(active: false),
            SizedBox(width: 5),
            CoustemIndecator(active: false),
            SizedBox(width: 5),

            CoustemIndecator(active: true),
          ],
        ),
        SizedBox(height: 20),

        Text(
          'Wonderful User Experience',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 30),
        Text(
          'Start exploring now and experience the\n convenience of online shopping at its best.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
        ),
      ],
    );
  
  }
}
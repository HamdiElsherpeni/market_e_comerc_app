import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/function/app_assets.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/coustem_indecator.dart';

class ScreanTwo extends StatelessWidget {
  const ScreanTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Image.asset(AppAssets.onbording2),
        ),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoustemIndecator(active: false),
            SizedBox(width: 5),
            CoustemIndecator(active: true),
            SizedBox(width: 5),

            CoustemIndecator(active: false),
          ],
        ),
        SizedBox(height: 20),

        Text(
          'Easy to Buy',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 30),
        Text(
          'Find the perfect item that suits your style and \nneeds With secure payment options and fast\n delivery, shopping has never been easier',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/category_item.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/proudct_abb_bar.dart';

class MoreProductBandCattegory extends StatelessWidget {
  const MoreProductBandCattegory({super.key, required this.titel});
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              ProudctAbbBar(titel: titel ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: 20,

                  itemBuilder: (context, index) {
                    return CategoryItem();
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/offers_widgwt.dart';

class ListViewOffers extends StatelessWidget {
  const ListViewOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: OffersWidgwt(),
        );
      },
    );
  }
}

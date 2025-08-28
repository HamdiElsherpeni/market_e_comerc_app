import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/product_more.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductMore(titel: 'Favorites');
  }
}

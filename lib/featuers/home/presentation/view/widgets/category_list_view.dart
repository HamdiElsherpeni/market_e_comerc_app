import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/categores_cubit/categores_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/category_item.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';
import '../../../../../core/widgets/coustem_loading_indecator.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key});
  final List<String> fixedImageUrls = [
    AppAssets.adidas,
    AppAssets.apple,
    AppAssets.canon,
    AppAssets.ck,
    AppAssets.del,
    AppAssets.hp,
  ];
  List<String> titel = [
    'Adidas',
    'Apple',
    'Canon',
    'Calvin Klein',
    'Dell',
    'HP',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoresCubit, CategoresState>(
      builder: (context, state) {
        if (state is CategoresSucess) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5, // المسافة الأفقية بين العناصر
              mainAxisSpacing: 4, // المسافة الرأسية بين العناصر
              childAspectRatio: 1 / 1.4,
            ),
            itemCount: fixedImageUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CategoryItem(
                  name: titel[index],
                  assetImage: fixedImageUrls[index],
                ),
              );
            },
          );
        } else if (state is CategoreFailer) {
          return CoustemFeatureFailler(errorMassge: state.errorMassge);
        } else {
          return CoustemLoadingIndecator();
        }
      },
    );
  }
}

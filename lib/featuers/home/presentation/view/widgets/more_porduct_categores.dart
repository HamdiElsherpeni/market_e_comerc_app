import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/category_item.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';
import '../../../../../core/widgets/coustem_loading_indecator.dart';
import '../../manger_model/categores_cubit/categores_cubit.dart';

class MorePorductCategores extends StatelessWidget {
  MorePorductCategores({super.key});
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              ProudctAbbBar(titel: "More Categores"),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<CategoresCubit, CategoresState>(
                  builder: (context, state) {
                    if (state is CategoresSucess) {
                      final categores = state.categores;
                      if (categores.isEmpty) {
                        return const Center(
                          child: Text('No categories available'),
                        );
                      }
                      return GridView.builder(
                        itemCount: titel.length,
                        itemBuilder: (context, index) {
                          final category = categores[index];
                          return CategoryItem(
                            name: titel[index],
                            assetImage: fixedImageUrls[index],
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                      );
                    } else if (state is CategoreFailer) {
                      return CoustemFeatureFailler(
                        errorMassge: state.errorMassge,
                      );
                    } else {
                      return const CoustemLoadingIndecator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

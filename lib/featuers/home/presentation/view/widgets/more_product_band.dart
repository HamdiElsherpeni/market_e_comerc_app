import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/brands_cubit/brands_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/category_item.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';
import '../../../../../core/widgets/coustem_loading_indecator.dart';

class MoreProductBands extends StatelessWidget {
  const MoreProductBands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              ProudctAbbBar(titel: 'More Prands'),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<BrandsCubit, BrandsState>(
                  builder: (context, state) {
                    if (state is BrandsSucesss) {
                      // نتأكد أن القائمة ليست فارغة
                      final brands = state.brands;
                      if (brands.isEmpty) {
                        return const Center(
                          child: Text('No brands available'),
                        );
                      }
                      return GridView.builder(
                        itemCount: brands.length,
                        itemBuilder: (context, index) {
                          final brand = brands[index];
                          return CategoryItem(
                            urlImage:
                                'https://tse1.mm.bing.net/th/id/OIP.j1sMPSP-emIbWhpgbf50zQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
                            name: brand.name ?? 'No Name',
                          );
                        },
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      );
                    } else if (state is BrandsFailer) {
                      return CoustemFeatureFailler(
                        errorMassge: state.erorrMassage,
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

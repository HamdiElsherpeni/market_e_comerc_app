import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/brands_cubit/brands_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/brands_item.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';
import '../../../../../core/widgets/coustem_loading_indecator.dart';

class BarndsListView extends StatelessWidget {
   BarndsListView({super.key});
List<String> imageUrls = [
  AppAssets.food,
  AppAssets.fashion,
  AppAssets.futuresevnth,

  ];
  List<String> titel = [
    'Food',
    'Fashion',
    'Future Seventh',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsSucesss) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: BrandsItem(assetImage: imageUrls[index],
                
                  ),
              );
            },
          );
        } else if (state is BrandsFailer) {
          return CoustemFeatureFailler(errorMassge: state.erorrMassage);
        } else {
          return CoustemLoadingIndecator();
        }
      },
    );
  }
}

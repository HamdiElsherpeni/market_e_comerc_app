import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/brands_cubit/brands_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/brands_item.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';
import '../../../../../core/widgets/coustem_loading_indecator.dart';

class BarndsListView extends StatelessWidget {
  const BarndsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsSucesss) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: BrandsItem(
                  urlImage:
                      state.brands[index].imagePath ??
                      'https://tse1.mm.bing.net/th/id/OIP.j1sMPSP-emIbWhpgbf50zQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
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

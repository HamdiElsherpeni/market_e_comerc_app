import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_loading_indecator.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/populer_product_cubit/populer_product_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_prodect_item.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';

class PopularProductListView extends StatelessWidget {
  const PopularProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulerProductCubit, PopulerProductState>(
      builder: (context, state) {
        if (state is PopulerProducSucsess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CoustemProdectItem(
                  image:
                      state.prodducts[index].images?[0] ??
                      'https://tse1.mm.bing.net/th/id/OIP.j1sMPSP-emIbWhpgbf50zQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',

                  name: "m,mm",
                  price: state.prodducts[index].price ?? 0,
                  id: state.prodducts[index].id ?? '',
                ),
              );
            },
          );
        } else if (state is PopulerProductFailer) {
          return CoustemFeatureFailler(errorMassge: state.erorrMassage);
        } else {
          return CoustemLoadingIndecator();
        }
      },
    );
  }
}

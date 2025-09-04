import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_prodect_item.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';
import '../../../../../core/widgets/coustem_loading_indecator.dart';
import '../../manger_model/populer_product_cubit/populer_product_cubit.dart';

class ProdudctAllMore extends StatelessWidget {
  const ProdudctAllMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              ProudctAbbBar(titel: 'Product Populer'),
              SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<PopulerProductCubit, PopulerProductState>(
                  builder: (context, state) {
                    if (state is PopulerProducSucsess) {
                      return GridView.builder(
                        itemCount: state.prodducts.length,

                        itemBuilder: (context, index) {
                          return CoustemProdectItem(
                            image:
                                state.prodducts[index].images?[0] ??
                                'https://tse1.mm.bing.net/th/id/OIP.j1sMPSP-emIbWhpgbf50zQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
                           
                            name: "",
                            price: state.prodducts[index].price ?? 0,
                            id: state.prodducts[index].id ?? '',
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      );
                    } else if (state is PopulerProductFailer) {
                      return CoustemFeatureFailler(
                        errorMassge: state.erorrMassage,
                      );
                    } else {
                      return CoustemLoadingIndecator();
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

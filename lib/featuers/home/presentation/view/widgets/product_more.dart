import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/populer_product_cubit/populer_product_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_prodect_item.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';

class ProductMore extends StatelessWidget {
  const ProductMore({super.key, required this.titel});
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              ProudctAbbBar(titel: titel),
              SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<PopulerProductCubit, PopulerProductState>(
                  builder: (context, state) {
                    return GridView.builder(
                      itemCount: 20,

                      itemBuilder: (context, index) {
                       if (state is PopulerProducSucsess)
                       {
                         return CoustemProdectItem(image:  state.prodducts[index].images?[0] ??
                      'https://tse1.mm.bing.net/th/id/OIP.j1sMPSP-emIbWhpgbf50zQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
                  name:'', price:state.prodducts[index].price??0,);
                       }
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    );
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

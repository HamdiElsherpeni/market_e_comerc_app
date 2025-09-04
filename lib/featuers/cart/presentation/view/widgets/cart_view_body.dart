import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/get_product_cubit/get_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/view/widgets/cart_empity.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/view/widgets/cart_list_view.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';
import '../../../../../core/widgets/coustem_loading_indecator.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubitCubit, GetProductCubitState>(
      builder: (context, state) {
        if (State is GetProductCubitSucess) {
          return CartListView();
        } else if (state is GetProductCubitFailer) {
          return CoustemFeatureFailler(errorMassge: state.errorMassge);
        } else if (state is GetProductCubitInitial) {
          return CartEmpity();
        } else {
          return CoustemLoadingIndecator();
        }
      },
    );
  }
}

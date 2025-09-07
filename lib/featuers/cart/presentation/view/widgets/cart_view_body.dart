import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/get_product_cubit/get_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/view/widgets/cart_empity.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/view/widgets/cart_list_view.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';
import '../../../../../core/widgets/coustem_search_contaner.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubitCubit, GetProductCubitState>(
      builder: (context, state) {
        if (state is GetProductCubitSucess) {
          return RefreshIndicator(
            onRefresh: () {
              return BlocProvider.of<GetProductCubitCubit>(
                context,
              ).GetProduct();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  ProudctAbbBar(titel: 'Cart'),
                  SizedBox(height: 10),

                  CoustemSearchContaner(),
                  SizedBox(height: 10),

                  Expanded(
                    child: CartListView(getCartResponse: state.getProducts),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetProductCubitFailer) {
          return CoustemFeatureFailler(errorMassge: state.errorMassge);
        } else if(state is GetProductCubitLoading) {
          return CartEmpity();
        }
        else {
          return const Text('');
        }
      },
    );
  }
}

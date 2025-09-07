import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_loading_indecator.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/delet_favi_cubit/delete_fvie_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/top_search/top_search_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_prodect_item_home.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/add_product_cubit/add_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/delet_product_cubit/delet_proudcut_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/add_favi_cubit/add_favi_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/get_product_cubit/get_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/get_favi_cubit/get_favi_cubit.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';

class BestForYouList extends StatelessWidget {
  const BestForYouList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopSearchCubit, TopSearchState>(
      builder: (context, state) {
        if (state is TopSearchSucess) {
          final products = state.topSearch.take(3).toList();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final productId = product.id ?? '';

              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: MultiBlocListener(
                  listeners: [
                    // Add to cart
                    BlocListener<AddProductCubitCubit, AddProductCubitState>(
                      listener: (context, addState) {
                        if (addState is AddProductCubitFailer &&
                            addState.productId == productId) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(addState.errorMassge)),
                          );
                        }
                      },
                    ),
                    // Delete from cart
                    BlocListener<DeletProudcutCubitCubit,
                        DeletProudcutCubitState>(
                      listener: (context, delState) {
                        if (delState is DeletProudcutCubitFailer &&
                            delState.productId == productId) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(delState.errorMassge)),
                          );
                        }
                      },
                    ),
                    // Add favorite
                    BlocListener<AddFaviCubit, AddFaviState>(
                      listener: (context, favState) {
                        if (favState is AddFaviFailer &&
                            favState.productId == productId) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(favState.errorMassge)),
                          );
                        }
                      },
                    ),
                    // Delete favorite
                    BlocListener<DeleteFvieCubit, DeleteFvieState>(
                      listener: (context, delFavState) {
                        if (delFavState is DeleteFvieFailer &&
                            delFavState.productId == productId) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(delFavState.errorMassge)),
                          );
                        }
                      },
                    ),
                  ],
                  child: BlocBuilder<GetProductCubitCubit,
                      GetProductCubitState>(
                    builder: (context, cartState) {
                      bool isAdded = false;
                      int quantity = 1;
                      if (cartState is GetProductCubitSucess) {
                        final exists = cartState.getProducts
                            .any((p) => p.id == productId);
                        isAdded = exists;
                      }

                      return BlocBuilder<GetFaviCubit, GetFaviState>(
                        builder: (context, faviState) {
                          bool isFavorite = false;
                          if (faviState is GetFaviSucsess) {
                            isFavorite = faviState.getFavi
                                    .any((p) => p.id == productId) ??
                                false;
                          }

                          return BlocBuilder<AddProductCubitCubit,
                              AddProductCubitState>(
                            builder: (context, addState) {
                              final isLoading = addState
                                      is AddProductCubitLoading &&
                                  addState.productId == productId;

                              return CoustemProdectItem(
                                image:
                                    'https://tse4.mm.bing.net/th/id/OIP.YOk5SbNmSZSU7POZ-tA78AHaHa?cb=ucfimg2ucfimg=1&w=980&h=980&rs=1&pid=ImgDetMain&o=7&rm=3',
                                name:  '',
                                price: 0,
                                id: productId,
                                isAdded: isAdded,
                                isLoading: isLoading,
                                isFavorite: isFavorite,
                                onPressed: () {
                                  if (!isAdded) {
                                    context
                                        .read<AddProductCubitCubit>()
                                        .addProduct(productId: productId);
                                  } else {
                                    context
                                        .read<DeletProudcutCubitCubit>()
                                        .deletProduct(productId: productId);
                                  }
                                },
                                onFavoritePressed: () {
                                  if (!isFavorite) {
                                    context
                                        .read<AddFaviCubit>()
                                        .addFaviProduct(productId: productId);
                                  } else {
                                    context
                                        .read<DeleteFvieCubit>()
                                        .deletFaviProduct(productId: productId);
                                  }
                                },
                                onTabProductDetiels: () {
                                  GoRouter.of(context).push(
                                    AppRouter.KDeteliesPage,
                                    extra: product,
                                  );
                                },
                                quantity: quantity,
                                onIncrement: () {
                                  // ممكن تستخدم Cubit خاص للكمية هنا
                                },
                                onDecrement: () {
                                  // نفس الكلام
                                },
                                onRemove: () {
                                  context
                                      .read<DeletProudcutCubitCubit>()
                                      .deletProduct(productId: productId);
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        } else if (state is TopSearchFailer) {
          return CoustemFeatureFailler(errorMassge: state.erorrMassage);
        } else {
          return const CoustemLoadingIndecator();
        }
      },
    );
  }
}

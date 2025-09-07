import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_loading_indecator.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/populer_product_cubit/populer_product_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_prodect_item_home.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/add_product_cubit/add_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/delet_product_cubit/delet_proudcut_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/add_favi_cubit/add_favi_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/delet_favi_cubit/delete_fvie_cubit.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';

class PopularProductListView extends StatefulWidget {
  const PopularProductListView({super.key});

  @override
  State<PopularProductListView> createState() => _PopularProductListViewState();
}

class _PopularProductListViewState extends State<PopularProductListView> {
  /// نخزن الكمية لكل منتج
  final Map<String, int> _quantities = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulerProductCubit, PopulerProductState>(
      builder: (context, state) {
        if (state is PopulerProducSucsess) {
          final products = state.prodducts.take(3).toList();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final productId = product.id ?? '';

              // لو المنتج لسه معندوش كمية نبدأه بـ 1
              _quantities.putIfAbsent(productId, () => 1);

              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: BlocConsumer<AddProductCubitCubit, AddProductCubitState>(
                  listener: (context, addState) {
                    if (addState is AddProductCubitFailer &&
                        addState.productId == productId) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(addState.errorMassge)),
                      );
                    }
                  },
                  builder: (context, addState) {
                    bool isLoading = addState is AddProductCubitLoading &&
                        addState.productId == productId;
                    bool isAdded = addState is AddProductCubitSucsess &&
                        addState.productId == productId;

                    return BlocConsumer<AddFaviCubit, AddFaviState>(
                      listener: (context, favState) {
                        if (favState is AddFaviFailer &&
                            favState.productId == productId) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(favState.errorMassge)),
                          );
                        }
                      },
                      builder: (context, favState) {
                        bool isFavorite = favState is AddFaviSucess &&
                            favState.productId == productId;

                        return CoustemProdectItem(
                          image: product.images?.isNotEmpty == true
                              ? product.images![0]
                              : 'https://tse1.mm.bing.net/th/id/OIP.j1sMPSP-emIbWhpgbf50zQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
                          name: product.title ?? '',
                          price: product.price ?? 0,
                          id: productId,
                          isAdded: isAdded,
                          isLoading: isLoading,
                          isFavorite: isFavorite,
                          quantity: _quantities[productId] ?? 1,
                          onPressed: () {
                            if (!isAdded) {
                              context
                                  .read<AddProductCubitCubit>()
                                  .addProduct(productId: productId);
                                setState(() {
                                  
                                });
                            } else {
                              context
                                  .read<DeletProudcutCubitCubit>()
                                  .deletProduct(productId: productId);
                                  setState(() {
                                    
                                  });
                            }
                          },
                          onFavoritePressed: () {
                            if (!isFavorite) {
                              context
                                  .read<AddFaviCubit>()
                                  .addFaviProduct(productId: productId);
                                  setState(() {
                                  
                                });
                            } else {
                              context
                                  .read<DeleteFvieCubit>()
                                  .deletFaviProduct(productId: productId);
                                  setState(() {
                                  
                                });
                            }
                          },
                          onTabProductDetiels: () {
                            GoRouter.of(context).push(
                              AppRouter.KDeteliesPage,
                              extra: {
                                "images": product.images ?? [],
                                "title": product.title ?? '',
                                "description": product.description ?? '',
                                "price": product.price ?? 0,
                                "rating": product.rating ?? 0,
                                "freeShipping": true,
                                "sizes": [38, 39, 40, 41],
                              },
                            );
                          },
                          onIncrement: () {
                            setState(() {
                              _quantities[productId] =
                                  (_quantities[productId] ?? 1) + 1;
                            });
                          },
                          onDecrement: () {
                            setState(() {
                              if ((_quantities[productId] ?? 1) > 1) {
                                _quantities[productId] =
                                    (_quantities[productId] ?? 1) - 1;
                              }
                            });
                          },
                          onRemove: () {
                            context
                                .read<DeletProudcutCubitCubit>()
                                .deletProduct(productId: productId);
                                setState(() {
                                  
                                });
                          },
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        } else if (state is PopulerProductFailer) {
          return CoustemFeatureFailler(errorMassge: state.erorrMassage);
        } else {
          return const CoustemLoadingIndecator();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_loading_indecator.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/populer_product_cubit/populer_product_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_prodect_item_home.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/add_product_cubit/add_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/delet_product_cubit/delet_proudcut_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/get_product_cubit/get_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/add_favi_cubit/add_favi_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/delet_favi_cubit/delete_fvie_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/get_favi_cubit/get_favi_cubit.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';
import '../../../../../core/widgets/coustem_feature_failler.dart';

class ProductMore extends StatefulWidget {
  const ProductMore({super.key, required this.titel});
  final String titel;

  @override
  State<ProductMore> createState() => _ProductMoreState();
}

class _ProductMoreState extends State<ProductMore> {
  /// نخزن الكمية لكل منتج
  final Map<String, int> _quantities = {};

  @override
  void initState() {
    super.initState();

    /// استدعاء الكارت و الفيفوريت مرة واحدة
    context.read<GetProductCubitCubit>().GetProduct();
    context.read<GetFaviCubit>().GetFaviProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              ProudctAbbBar(titel: widget.titel),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<PopulerProductCubit, PopulerProductState>(
                  builder: (context, popularState) {
                    if (popularState is PopulerProducSucsess) {
                      
                      final products = popularState.prodducts;

                      return BlocBuilder<
                        GetProductCubitCubit,
                        GetProductCubitState
                      >(
                        builder: (context, cartState) {
                          final cartIds = cartState is GetProductCubitSucess
                              ? cartState.getProducts.map((e) => e.id).toSet()
                              : <String>{};

                          return BlocBuilder<GetFaviCubit, GetFaviState>(
                            builder: (context, faviState) {
                              final favIds = faviState is GetFaviSucsess
                                  ? faviState.getFavi.map((e) => e.id).toSet()
                                  : <String>{};

                              return GridView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: products.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.7,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                    ),
                                itemBuilder: (context, index) {
                                  final product = products[index];
                                  final productId = product.id ?? '';

                                  _quantities.putIfAbsent(productId, () => 1);

                                  final isAdded = cartIds.contains(productId);
                                  final isFavorite = favIds.contains(productId);

                                  return CoustemProdectItem(
                                    image: product.images?.isNotEmpty == true
                                        ? product.images![0]
                                        : 'https://tse1.mm.bing.net/th/id/OIP.j1sMPSP-emIbWhpgbf50zQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
                                    name: product.title ?? '',
                                    price: product.price ?? 0,
                                    id: productId,
                                    isAdded: isAdded,
                                    isLoading: false,
                                    isFavorite: isFavorite,
                                    quantity: _quantities[productId] ?? 1,
                                    onPressed: () {
                                      if (!isAdded) {
                                        context
                                            .read<AddProductCubitCubit>()
                                            .addProduct(productId: productId);
                                        setState(() {});
                                      } else {
                                        context
                                            .read<DeletProudcutCubitCubit>()
                                            .deletProduct(productId: productId);
                                        setState(() {});
                                      }
                                    },
                                    onFavoritePressed: () {
                                      if (!isFavorite) {
                                        context
                                            .read<AddFaviCubit>()
                                            .addFaviProduct(
                                              productId: productId,
                                            );
                                        setState(() {});
                                      } else {
                                        context
                                            .read<DeleteFvieCubit>()
                                            .deletFaviProduct(
                                              productId: productId,
                                            );
                                        setState(() {});
                                      }
                                    },
                                    onTabProductDetiels: () {
                                      GoRouter.of(context).push(
                                        AppRouter.KDeteliesPage,
                                        extra: {
                                          "images": product.images ?? [],
                                          "title": product.title ?? '',
                                          "description":
                                              product.description ?? '',
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
                                      setState(() {});
                                    },
                                    onDecrement: () {
                                      setState(() {
                                        if ((_quantities[productId] ?? 1) > 1) {
                                          _quantities[productId] =
                                              (_quantities[productId] ?? 1) - 1;
                                        }
                                      });
                                      setState(() {});
                                    },
                                    onRemove: () {
                                      context
                                          .read<DeletProudcutCubitCubit>()
                                          .deletProduct(productId: productId);
                                      setState(() {});
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    } else if (popularState is PopulerProductFailer) {
                      return CoustemFeatureFailler(
                        errorMassge: popularState.erorrMassage,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/populer_product_cubit/populer_product_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_prodect_item_home.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/add_product_cubit/add_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/delet_product_cubit/delet_proudcut_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/add_favi_cubit/add_favi_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/delet_favi_cubit/delete_fvie_cubit.dart';

class ProductMore extends StatefulWidget {
  const ProductMore({super.key, required this.titel});
  final String titel;

  @override
  State<ProductMore> createState() => _ProductMoreState();
}

class _ProductMoreState extends State<ProductMore> {
  final Map<String, bool> _isAdded = {};
  final Map<String, bool> _isLoading = {};
  final Map<String, bool> _isFavorite = {};
  final Map<String, bool> _isFavoriteLoading = {};

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
                  builder: (context, state) {
                    if (state is PopulerProducSucsess) {
                      final products = state.prodducts;

                      return GridView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          final productId = product.id ?? '';

                          _isAdded.putIfAbsent(productId, () => false);
                          _isLoading.putIfAbsent(productId, () => false);
                          _isFavorite.putIfAbsent(productId, () => false);
                          _isFavoriteLoading.putIfAbsent(productId, () => false);

                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: MultiBlocListener(
                              listeners: [
                                BlocListener<AddProductCubitCubit, AddProductCubitState>(
                                  listener: (context, addState) {
                                    if (addState is AddProductCubitLoading &&
                                        addState.productId == productId) {
                                      setState(() => _isLoading[productId] = true);
                                    } else if (addState is AddProductCubitSucsess &&
                                        addState.productId == productId) {
                                      setState(() {
                                        _isAdded[productId] = true;
                                        _isLoading[productId] = false;
                                      });
                                    } else if (addState is AddProductCubitFailer &&
                                        addState.productId == productId) {
                                      setState(() => _isLoading[productId] = false);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(addState.errorMassge)),
                                      );
                                    }
                                  },
                                ),
                                BlocListener<DeletProudcutCubitCubit, DeletProudcutCubitState>(
                                  listener: (context, delState) {
                                    if (delState is DeletProudcutCubitLoading &&
                                        delState.productId == productId) {
                                      setState(() => _isLoading[productId] = true);
                                    } else if (delState is DeletProudcutCubitSucsess &&
                                        delState.productId == productId) {
                                      setState(() {
                                        _isAdded[productId] = false;
                                        _isLoading[productId] = false;
                                      });
                                    } else if (delState is DeletProudcutCubitFailer &&
                                        delState.productId == productId) {
                                      setState(() => _isLoading[productId] = false);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(delState.errorMassge)),
                                      );
                                    }
                                  },
                                ),
                                BlocListener<AddFaviCubit, AddFaviState>(
                                  listener: (context, favState) {
                                    if (favState is AddFaviLoading &&
                                        favState.productId == productId) {
                                      setState(() => _isFavoriteLoading[productId] = true);
                                    } else if (favState is AddFaviSucess &&
                                        favState.productId == productId) {
                                      setState(() {
                                        _isFavorite[productId] = true;
                                        _isFavoriteLoading[productId] = false;
                                      });
                                    } else if (favState is AddFaviFailer &&
                                        favState.productId == productId) {
                                      setState(() => _isFavoriteLoading[productId] = false);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(favState.errorMassge)),
                                      );
                                    }
                                  },
                                ),
                                BlocListener<DeleteFvieCubit, DeleteFvieState>(
                                  listener: (context, delFavState) {
                                    if (delFavState is DeleteFvieLoading &&
                                        delFavState.productId == productId) {
                                      setState(() => _isFavoriteLoading[productId] = true);
                                    } else if (delFavState is DeleteFvieSucess &&
                                        delFavState.productId == productId) {
                                      setState(() {
                                        _isFavorite[productId] = false;
                                        _isFavoriteLoading[productId] = false;
                                      });
                                    } else if (delFavState is DeleteFvieFailer &&
                                        delFavState.productId == productId) {
                                      setState(() => _isFavoriteLoading[productId] = false);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(delFavState.errorMassge)),
                                      );
                                    }
                                  },
                                ),
                              ],
                              child: CoustemProdectItem(
                                image: product.images?[0] ??
                                    'https://tse1.mm.bing.net/th/id/OIP.j1sMPSP-emIbWhpgbf50zQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
                                name: product.title ?? '',
                                price: product.price ?? 0,
                                id: productId,
                                isAdded: _isAdded[productId]!,
                                isLoading: _isLoading[productId]!,
                                isFavorite: _isFavorite[productId]!,
                                onPressed: () {
                                  if (!_isAdded[productId]!) {
                                    context.read<AddProductCubitCubit>().addProduct(productId: productId);
                                  } else {
                                    context.read<DeletProudcutCubitCubit>().deletProduct(productId: productId);
                                  }
                                },
                                onFavoritePressed: () {
                                  if (!_isFavorite[productId]!) {
                                    context.read<AddFaviCubit>().addFaviProduct(productId: productId);
                                  } else {
                                    context.read<DeleteFvieCubit>().deletFaviProduct(productId: productId);
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is PopulerProductFailer) {
                      return Center(child: Text(state.erorrMassage));
                    } else {
                      return const Center(child: CircularProgressIndicator());
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

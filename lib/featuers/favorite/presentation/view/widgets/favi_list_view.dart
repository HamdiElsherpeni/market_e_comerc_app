import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/get_favi_product/get_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/delet_favi_cubit/delete_fvie_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/view/widgets/coustem_product_item_cart.dart';

class FaviListView extends StatefulWidget {
  const FaviListView({super.key, required this.getFaviResponse});

  final List<GetFaviResponse> getFaviResponse;

  @override
  State<FaviListView> createState() => _FaviListViewState();
}

class _FaviListViewState extends State<FaviListView> {
  late List<GetFaviResponse> faviItems;

  /// متابعة حالة اللودنج لكل منتج
  final Map<String, bool> _isLoading = {};

  @override
  void initState() {
    super.initState();
    faviItems = List.from(widget.getFaviResponse);

    // تهيئة الحالات
    for (var item in faviItems) {
      _isLoading[item.id] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (faviItems.isEmpty) {
      return const Center(child: Text("Favorite is empty"));
    }

    return GridView.builder(
      itemCount: faviItems.length,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final item = faviItems[index];

        // تأكد من وجود الحالة في الخريطة
        _isLoading.putIfAbsent(item.id, () => false);

        return BlocListener<DeleteFvieCubit, DeleteFvieState>(
          listener: (context, state) {
            if (state is DeleteFvieLoading && state.productId == item.id) {
              setState(() => _isLoading[item.id] = true);
            } else if (state is DeleteFvieSucess &&
                state.productId == item.id) {
              setState(() {
                faviItems.removeWhere((element) => element.id == item.id);
                _isLoading.remove(item.id);
              });
            } else if (state is DeleteFvieFailer &&
                state.productId == item.id) {
              setState(() => _isLoading[item.id] = false);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMassge)));
            }
          },
          child: CoustemProductItemCart(
            image: item.images.isNotEmpty ? item.images[0] : "",
            name: item.title,
            price: item.price,
            isFavorite: true, // لأنه داخل الفافوريت
            isLoading: _isLoading[item.id]!,
            onFavoritePressed: () {
              context.read<DeleteFvieCubit>().deletFaviProduct(
                    productId: item.id,
                  );
            },
            onPressed: () {
              debugPrint("Add to cart: ${item.title}");
            },
            onTap: () {
              GoRouter.of(context).push(AppRouter.KDeteliesPage, extra: item);
            },
            isAdded: true,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/get_cart/get_cart_response.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/delet_product_cubit/delet_proudcut_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/view/widgets/coustem_product_item_cart.dart';

class CartListView extends StatefulWidget {
  const CartListView({super.key, required this.getCartResponse});

  final List<GetCartResponse> getCartResponse;

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  late List<GetCartResponse> cartItems;

  // حالة كل عنصر للتحكم بالزرار خارجيًا
  final Map<String, bool> _isRemoved = {};
  final Map<String, bool> _isLoading = {};

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.getCartResponse);

    // تهيئة الحالة لكل عنصر (الحالة الأساسية Remove)
    for (var item in cartItems) {
      _isRemoved[item.id] = false;
      _isLoading[item.id] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return const Center(child: Text("Cart is empty"));
    }

    return GridView.builder(
      itemCount: cartItems.length,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final item = cartItems[index];

        // تهيئة الحالة إذا كانت غير موجودة
        _isRemoved.putIfAbsent(item.id, () => false);
        _isLoading.putIfAbsent(item.id, () => false);

        return BlocListener<DeletProudcutCubitCubit, DeletProudcutCubitState>(
          listener: (context, state) {
            if (state is DeletProudcutCubitLoading &&
                state.productId == item.id) {
              setState(() => _isLoading[item.id] = true);
            } else if (state is DeletProudcutCubitSucsess &&
                state.productId == item.id) {
              setState(() {
                cartItems.removeWhere((element) => element.id == item.id);
                _isRemoved.remove(item.id);
                _isLoading.remove(item.id);
              });
            } else if (state is DeletProudcutCubitFailer &&
                state.productId == item.id) {
              setState(() => _isLoading[item.id] = false);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMassge)),
              );
            }
          },
          child: CoustemProductItemCart(
            image: item.images[0],
            name: item.title,
            price: item.price,
            isAdded: _isRemoved[item.id]!,
            isLoading: _isLoading[item.id]!,
            onPressed: () {
              if (!_isRemoved[item.id]!) {
                context
                    .read<DeletProudcutCubitCubit>()
                    .deletProduct(productId: item.id);
              } else {
                // لو عايز ممكن تضيف "Add again" هنا
              }
            },
          ),
        );
      },
    );
  }
}

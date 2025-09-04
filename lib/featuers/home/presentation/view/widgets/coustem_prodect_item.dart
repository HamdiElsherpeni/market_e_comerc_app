import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/add_product_cubit/add_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/delet_product_cubit/delet_proudcut_cubit_cubit.dart';

class CoustemProdectItem extends StatefulWidget {
  const CoustemProdectItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.id,
  });

  final String image;
  final int price;
  final String id;
  final String name;

  @override
  State<CoustemProdectItem> createState() => _CoustemProdectItemState();
}

class _CoustemProdectItemState extends State<CoustemProdectItem> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return MultiBlocListener(
      listeners: [
        BlocListener<AddProductCubitCubit, AddProductCubitState>(
          listener: (context, state) {
            if (state is AddProductCubitSucsess &&
                state.productId == widget.id) {
              setState(() {
                isAdded = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.addToCartResponse.message)),
              );
            } else if (state is AddProductCubitFailer) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMassge)));
            }
          },
        ),

        BlocListener<DeletProudcutCubitCubit, DeletProudcutCubitState>(
          listener: (context, state) {
            if (state is DeletProudcutCubitSucsess) {
              setState(() {
                isAdded = false;
              });
            } else if (state is DeletProudcutCubitFailer) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMassge)));
            }
          },
        ),
      ],
      child: Column(
        children: [
          Container(
            width: 130,
            height: 140,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(
                    255,
                    117,
                    180,
                    231,
                  ).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(2, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blue.shade100),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة المنتج
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Container(
                        height: 70,
                        width: 130,
                        color: Colors.blue.shade50,
                        child: Image.network(
                          widget.image,
                          height: 60,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 0),

                // السعر
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.price} LE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: isDark ? Colors.black : Colors.black,
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            size: 13,
                            color: Colors.black,
                          ),
                          SizedBox(width: 2),
                          Text(
                            " 2.5",
                            style: TextStyle(fontSize: 11, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // الاسم
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 0,
                  ),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark ? Colors.black : Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // زرار Add / Remove
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SizedBox(
                    height: 20,
                    child: TextButton(
                      onPressed: () {
                        if (!isAdded) {
                          // ✅ استدعاء الإضافة
                          context.read<AddProductCubitCubit>().addProduct(
                            productId: widget.id,
                          );
                        } else {
                          // ✅ استدعاء الحذف
                          context.read<DeletProudcutCubitCubit>().deletProduct(
                            productId: widget.id,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          color: isAdded ? Colors.red : Colors.blue,
                        ),
                        backgroundColor: isAdded
                            ? Colors.red.shade50
                            : Colors.blue.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 0,
                        ),
                        minimumSize: const Size(0, 24),
                      ),
                      child: Text(
                        isAdded ? "Remove" : "Add",
                        style: TextStyle(
                          color: isAdded ? Colors.red : Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

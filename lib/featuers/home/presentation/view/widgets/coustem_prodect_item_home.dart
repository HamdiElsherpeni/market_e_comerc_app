import 'package:flutter/material.dart';

class CoustemProdectItem extends StatelessWidget {
  const CoustemProdectItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    required this.isAdded,
    required this.isLoading,
    required this.isFavorite,
    required this.onPressed,
    required this.onFavoritePressed,
    required this.onTabProductDetiels,
    required this.quantity, // عدد المنتج
    required this.onIncrement, // زيادة
    required this.onDecrement, // نقصان
    required this.onRemove, // حذف
  });

  final String image;
  final int price;
  final String id;
  final String name;
  final bool isAdded;
  final bool isLoading;
  final bool isFavorite;
  final int quantity;
  final VoidCallback onPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTabProductDetiels;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        GestureDetector(
          onTap: onTabProductDetiels,
          child: Container(
            width: 130,
            height: 170,
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
              color: isDark ? Colors.black : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة المنتج + القلب
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
                          image,
                          height: 60,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // زرار القلب
                    Positioned(
                      right: 4,
                      top: 4,
                      child: InkWell(
                        onTap: onFavoritePressed,
                        child: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
          
                const SizedBox(height: 2),
          
                // السعر
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    "$price LE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
          
                // الاسم
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          
                // زرار Add أو أدوات التحكم في الكمية
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: SizedBox(
                    height: 28,
                    child: isAdded
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // زرار إنقاص
                              IconButton(
                                onPressed: onDecrement,
                                icon: const Icon(Icons.remove, size: 16),
                                color: Colors.red,
                              ),
          
                              // العدد
                              InkWell(
                                onTap: onRemove,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.red.shade50,
                                  ),
                                  child: Text(
                                    "$quantity",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
          
                              // زرار زيادة
                              IconButton(
                                onPressed: onIncrement,
                                icon: const Icon(Icons.add, size: 16),
                                color: Colors.blue,
                              ),
                            ],
                          )
                        : TextButton(
                            onPressed: isLoading ? null : onPressed,
                            style: TextButton.styleFrom(
                              side: const BorderSide(color: Colors.blue),
                              backgroundColor: Colors.blue.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    width: 10,
                                    height: 12,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    "Add",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                    ),
                                  ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

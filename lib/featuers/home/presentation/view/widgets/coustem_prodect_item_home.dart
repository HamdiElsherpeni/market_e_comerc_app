import 'package:flutter/material.dart';

class CoustemProdectItem extends StatelessWidget {
  const CoustemProdectItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    required this.isAdded,        // للتحكم بالزر من الخارج
    required this.isLoading,      // للتحكم بالزر من الخارج
    required this.onPressed,      // callback للزرار Add / Remove
    required this.onFavoritePressed, // callback للقلب
    required this.isFavorite,        // حالة القلب
  });

  final String image;
  final int price;
  final String id;
  final String name;
  final bool isAdded;
  final bool isLoading;
  final bool isFavorite;
  final VoidCallback onPressed;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 117, 180, 231).withOpacity(0.2),
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
                        color: isFavorite ? Colors.black : Colors.grey,
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

              // زرار Add / Remove
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: SizedBox(
                  height: 24,
                  child: TextButton(
                    onPressed: isLoading ? null : onPressed,
                    style: TextButton.styleFrom(
                      side: BorderSide(
                        color: isAdded ? Colors.red : Colors.blue,
                      ),
                      backgroundColor:
                          isAdded ? Colors.red.shade50 : Colors.blue.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
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
    );
  }
}

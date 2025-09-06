import 'package:flutter/material.dart';

class CoustemProductItemCart extends StatefulWidget {
  const CoustemProductItemCart({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.isAdded,     // للتحكم بالزرار Remove / Add
    required this.isLoading,   // للتحكم بالزرار
    required this.onPressed,   // callback للزرار Remove / Add
  });

  final String image;
  final int price;
  final String name;
  final bool isAdded;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  State<CoustemProductItemCart> createState() => _CoustemProductItemCartState();
}

class _CoustemProductItemCartState extends State<CoustemProductItemCart> {
  bool isFavi = false; // حالة القلب

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
                        widget.image,
                        height: 60,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // ❤️ زرار القلب
                  Positioned(
                    right: 4,
                    top: 4,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFavi = !isFavi;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: isFavi ? Colors.black : Colors.grey,
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
                  "${widget.price} LE",
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
                  widget.name,
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // زرار Remove / Add
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: SizedBox(
                  height: 24,
                  child: TextButton(
                    onPressed: widget.isLoading ? null : widget.onPressed,
                    style: TextButton.styleFrom(
                      side: BorderSide(
                        color: widget.isAdded ? Colors.blue : Colors.red,
                      ),
                      backgroundColor:
                          widget.isAdded ? Colors.blue.shade50 : Colors.red.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: widget.isLoading
                        ? const SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            widget.isAdded ? "Add" : "Remove",
                            style: TextStyle(
                              color: widget.isAdded ? Colors.blue : Colors.red,
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

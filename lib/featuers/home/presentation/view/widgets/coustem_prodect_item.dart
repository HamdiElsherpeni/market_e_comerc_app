import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';

class CoustemProdectItem extends StatefulWidget {
  CoustemProdectItem({
    super.key,
    required this.image,
    final double? rate = 0,
    required this.name, required this.price,
  });
  final String image;
  final int price;

  final String name;
  @override
  State<CoustemProdectItem> createState() => _CoustemProdectItemState();
}

class _CoustemProdectItemState extends State<CoustemProdectItem> {
  int favePress = 0;

  _CoustemProdectItemState();
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
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
                offset: Offset(2, 4),
              ),
            ],

            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blue.shade100),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Center(
                      child: Container(
                        height: 70,
                        width: 130,
                        color: Colors.blue.shade50,
                        child: Image.network(
                          widget.image, // غيرها حسب صورتك
                          height: 60,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "10% OFF",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: -9,
                    right: -3,
                    child: IconButton(
                      onPressed: () {
                        if (favePress == 0) {
                          favePress = 1;
                        } else {
                          favePress = 0;
                        }

                        setState(() {
                          print(favePress);
                        });
                      },
                      icon: Icon(
                        favePress == 1 ? Icons.favorite : Icons.favorite_border,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "799 LE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: isDark ? Colors.black : Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_border, size: 13, color: Colors.black),
                        SizedBox(width: 2),
                        Text(
                          " 2.5",
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark ? Colors.black : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// الاسم
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.blue, fontSize: 12),
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

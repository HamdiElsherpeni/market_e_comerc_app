import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_styls.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.assetImage,
   required this.name,
  });

  final String assetImage; // صورة من الـ assets
  final String name;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Container(
            height: 90,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 153, 171, 242).withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              child: Image.asset(
                assetImage,
                width: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name ,
            style: AppStyls.textStyle17.copyWith(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 10,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

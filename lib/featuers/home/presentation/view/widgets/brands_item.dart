import 'package:flutter/material.dart';

class BrandsItem extends StatelessWidget {
  const BrandsItem({super.key, required this.assetImage});

  final String assetImage; // هنا الصورة من الـ assets

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

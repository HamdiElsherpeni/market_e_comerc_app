import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';

class BrandsItem extends StatelessWidget {
  const BrandsItem({super.key, required this.urlImage});
  final String urlImage;
   String get fixedUrl {
   
    var url = urlImage.replaceAll("\\", "/");
    // التأكد إن الرابط يبدأ بـ https
    if (!url.startsWith("http")) {
      url = "https://marketi-app.onrender.com/$url";
    }
    return url;
  }
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
              child: Image.network(
                fixedUrl,
                width: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.red),
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          ],
    );
  }
}

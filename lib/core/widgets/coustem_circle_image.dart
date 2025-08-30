import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/function/app_router.dart';

class CoustemCircleImage extends StatelessWidget {
  const CoustemCircleImage({super.key, required this.urlImage});
  final String urlImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.KMyProfile);
      },
      child: CircleAvatar(
        radius: 19,
        backgroundColor: Colors.blueAccent,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: 34, // صغرتها
              height: 34,
            ),
          ),
        ),
      ),
    );
  }
}

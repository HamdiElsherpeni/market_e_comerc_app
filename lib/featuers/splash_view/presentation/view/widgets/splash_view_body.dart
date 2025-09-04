import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/utlis/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  @override
  void initState() {
  super.initState();
  Future.delayed(const Duration(seconds: 2), () async {
    final token = await SharedPreferenceManager.getToken(); // await هنا
    if (token != null && token.isNotEmpty) {
      GoRouter.of(context).go(AppRouter.KHomeView);
    } else {
      GoRouter.of(context).go(AppRouter.KOnBordong);
    }
  });
}

  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppAssets.logoSplash));
  }
}

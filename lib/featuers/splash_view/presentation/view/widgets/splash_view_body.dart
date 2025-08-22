import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/function/app_assets.dart';
import 'package:market_e_comerc_app/core/function/app_router.dart';

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
    Future.delayed(Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.KOnBordong);
    });
  }

  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppAssets.logoSplash));
  }
}

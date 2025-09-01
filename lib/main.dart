import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinin_repo/sinin_repo_implement.dart';
import 'package:market_e_comerc_app/featuers/auth/data/services/auth_services.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/sinin_cubit/sin_in_cubit.dart';
import 'package:market_e_comerc_app/featuers/splash_view/presentation/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
      create: (context) => SinInCubit(
        SininRepoImplement(AuthServices()),
      ),
    ),     ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/core/app_cubit/cubit/app_cubit_cubit.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinin_repo/sinin_repo_implement.dart';
import 'package:market_e_comerc_app/featuers/auth/data/services/auth_services.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/sinin_cubit/sin_in_cubit.dart';

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
          create: (context) => SinInCubit(SininRepoImplement(AuthServices())),
        ),
        BlocProvider(
          create: (context) => AppCubitCubit(),
        ),
      ],
      child: BlocBuilder<AppCubitCubit, AppCubitState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black,
              
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white70),
              ),
            ),
            themeMode: state.themeMode, // هنا بيتحدد من الكيوبت
          );
        },
      ),
    );
  }
}

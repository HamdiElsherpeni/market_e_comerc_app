import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/on_bording_view.dart';
import 'package:market_e_comerc_app/featuers/splash_view/presentation/view/splash_view.dart';

class AppRouter {
  static String KOnBordong='/onbording';
  static GoRouter router = GoRouter(
    
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashView();
      },
      
    ),
     GoRoute(
      path: KOnBordong,
      builder: (context, state) {
        return OnBordingView();
      },
      
    ),
  ],
);
}
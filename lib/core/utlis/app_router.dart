import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/shared_preferences.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/active_reset_repo/active_reset_pass_repo_implemn.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/active_reset_repo/active_reset_repo.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/reset_pass_repo/reset_pass_repo_implement.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinin_repo/sinin_repo.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinin_repo/sinin_repo_implement.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinup_repo/sinup_repo.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinup_repo/sinup_repo_impelemnt.dart';
import 'package:market_e_comerc_app/featuers/auth/data/services/auth_services.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/active_reset_cubit/active_reset_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/reset_pass_cubit/reset_pass_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/sinin_cubit/sin_in_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/sinup_cubit/sin_up_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/otp_view_body.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/home_view.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/all_barands_list_view.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/all_category_list_view.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/bay_again.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/best_for_you_view.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/view/favorite_view.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/popouler_product_view.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/product_more.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/forget_pass.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/login_vew.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/sinup_view.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/forget_pass_body_email.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/my_profile_view.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/on_bording_view.dart';
import 'package:market_e_comerc_app/featuers/splash_view/presentation/view/splash_view.dart';

class AppRouter {
  static String KOnBordong = '/onbording';
  static String KlogIn = '/loginView';
  static String KSinUp = '/sinupView';
  static String KForgetpassPhonnum = '/forgetpassphonnum';
  static String KForgetpassEmail = '/forgetpassemail';
  static String KHomeView = '/homeview';
  static String KPopuler = '/populer';
  static String KBuyAgain = '/buyagain';
  static String KBestFor = '/bestforyou';
  static String KFavie = '/bestforyou';
  static String KBrands = '/bbrands';
  static String KCtegory = '/category';
  static String KMyProfile = '/myprofile';
  static String KOtpView = '/otpvire';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: KOtpView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                ActiveResetCubit(ActiveResetPassRepoImplemn(AuthServices())),
            child: OtpVerificationScreen(phoneNumber: state.extra as String),
          );
        },
      ),
      GoRoute(
        path: KBrands,
        builder: (context, state) {
          return AllBarandsListView();
        },
      ),
      GoRoute(
        path: KCtegory,
        builder: (context, state) {
          return AllCategoryListView();
        },
      ),
      GoRoute(
        path: KFavie,
        builder: (context, state) {
          return FavoriteView();
        },
      ),
      GoRoute(
        path: KBestFor,
        builder: (context, state) {
          return BestForYouView();
        },
      ),
      GoRoute(
        path: KBuyAgain,
        builder: (context, state) {
          return BayAgain();
        },
      ),
      GoRoute(
        path: KPopuler,
        builder: (context, state) {
          return PopoulerProductView();
        },
      ),
      GoRoute(
        path: KOnBordong,
        builder: (context, state) {
          return OnBordingView();
        },
      ),
      GoRoute(
        path: KlogIn,
        builder: (context, state) {
          return LoginVew();
        },
      ),
      GoRoute(
        path: KSinUp,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SinUpCubit(SinupRepoImpelemnt(AuthServices())),
            child: SinupView(),
          );
        },
      ),
      GoRoute(
        path: KForgetpassPhonnum,
        builder: (context, state) {
          return ForgetPass();
        },
      ),
      GoRoute(
        path: KForgetpassEmail,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ResetPassCubit(
              ResetPassRepoImplement(authServices: AuthServices()),
            ),
            child: ForgetPassBodyEmail(),
          );
        },
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: KMyProfile,
        builder: (context, state) {
          return MyProfileView();
        },
      ),
    ],
  );
}

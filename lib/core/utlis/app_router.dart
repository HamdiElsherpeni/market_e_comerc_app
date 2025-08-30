import 'package:go_router/go_router.dart';
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









  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
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
          return SinupView();
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
          return ForgetPassBodyEmail();
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

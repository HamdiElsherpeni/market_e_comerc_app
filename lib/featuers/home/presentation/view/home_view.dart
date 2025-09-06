import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/featuers/cart/data/cart_services/cart_services.dart';
import 'package:market_e_comerc_app/featuers/cart/data/repos/cart_repo_implementation.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/manger/get_product_cubit/get_product_cubit_cubit.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/view/cart_view.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/repos/favi_repo_impelment.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/services_favi/services_favi.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/add_favi_cubit/add_favi_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/delet_favi_cubit/delete_fvie_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/view/favorite_view.dart';
import 'package:market_e_comerc_app/featuers/home/data/home_service/home_services.dart'
    show HomeServices;
import 'package:market_e_comerc_app/featuers/home/data/repos/brands_repo/brands_repo_impelent.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/categores_repo/categores_repo_impelement.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/populer_repo/populer_repo_implement.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/brands_cubit/brands_cubit.dart'
    show BrandsCubit;
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/categores_cubit/categores_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/populer_product_cubit/populer_product_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/home_view_body.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/menu_screen.dart';

import '../../data/repos/top_search_repo/top_search_implement.dart';
import '../manger_model/top_search/top_search_cubit.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _screens = [HomeViewBody(), CartView(), FavoriteView()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 3) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BrandsCubit(BrandsRepoImpelent(HomeServices()))..getBrands(),
        ),
        BlocProvider(
          create: (context) =>
              TopSearchCubit(TomSearchImplement(HomeServices()))
                ..getTopSearch(),
        ),
        BlocProvider(
          create: (context) =>
              PopulerProductCubit(PopulerRepoImplement(HomeServices()))
                ..getPopulerProducts(),
        ),
        BlocProvider(
          create: (context) =>
              CategoresCubit(CategoresRepoImpelement(HomeServices()))
                ..getCtegores(),
        ),
        BlocProvider(
          create: (context) =>
              GetProductCubitCubit(CartRepoImplementation(CartServices()))
                ..GetProduct(),
        ),
        BlocProvider(
          create: (context) => AddFaviCubit(FaviRepoImpelment(ServicesFavi())),
        ),
        BlocProvider(
          create: (context) =>
              DeleteFvieCubit(FaviRepoImpelment(ServicesFavi())),
        ),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7, // نص الشاشة
          child: Drawer(child: MenuScreen()),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: KprimaryColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          ],
        ),
      ),
    );
  }
}

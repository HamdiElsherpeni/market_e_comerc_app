import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_search_contaner.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/barnds_list_view.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/best_for_you_list.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/category_list_view.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_app_bar_home_view.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/head_list.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/offers_widgwt.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/popular_product_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CoustemAppBarHomeView(),
                    const SizedBox(height: 10),
                    CoustemSearchContaner(),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 90, child: OffersWidgwt()),
                    SizedBox(height: 9),
                    HeadList(
                      headName: 'Popular Product',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.KProuductAll);
                      },
                    ),
                    SizedBox(height: 180, child: PopularProductListView()),
                    SizedBox(height: 9),
                    HeadList(
                      headName: 'Brands',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.KCtegory);
                      },
                    ),
                    SizedBox(height: 250, child: CategoryListView()),
                    SizedBox(height: 2),
                    HeadList(
                      headName: 'Best for You',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.KBestFor);
                      },
                    ),
                    SizedBox(height: 180, child: BestForYouList()),
                    SizedBox(height: 2),
                    HeadList(
                      headName: 'Categories',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.KBrands);
                      },
                    ),
                    SizedBox(height: 100, child: BarndsListView()),
                    SizedBox(height: 2),
                    HeadList(
                      headName: 'By Again',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.KBuyAgain);
                      },
                    ),
                    SizedBox(height: 180, child: PopularProductListView()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_feature_failler.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_loading_indecator.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_search_contaner.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/get_favi_cubit/get_favi_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/view/widgets/favi_list_view.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  State<FavoriteViewBody> createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
  @override
  void initState() {
    super.initState();
    // استدعاء الفانكشن أول ما يفتح الاسكرين
    context.read<GetFaviCubit>().GetFaviProduct();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFaviCubit, GetFaviState>(
      builder: (context, state) {
        if (state is GetFaviSucsess) {
          return RefreshIndicator(
            onRefresh: () {
               return BlocProvider.of<GetFaviCubit>(
                context,
              ).GetFaviProduct();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const ProudctAbbBar(titel: 'Favorites'),
                  const SizedBox(height: 10),
            
                  const CoustemSearchContaner(),
                  const SizedBox(height: 10),
            
                  Expanded(child: FaviListView(getFaviResponse: state.getFavi)),
                ],
              ),
            ),
          );
        } else if (state is GetFaviFailer) {
          return CoustemFeatureFailler(errorMassge: state.errorMassge);
        } else if (state is GetFaviLoading) {
          return const CoustemLoadingIndecator();
        } else {
          return const Text('');
        }
      },
    );
  }
}

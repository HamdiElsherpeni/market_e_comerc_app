import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/repos/favi_repo_impelment.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/services_favi/services_favi.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/manger/get_favi_cubit/get_favi_cubit.dart';
import 'package:market_e_comerc_app/featuers/favorite/presentation/view/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFaviCubit(FaviRepoImpelment(ServicesFavi())),
      child: SafeArea(child: FavoriteViewBody()),
    );
  }
}

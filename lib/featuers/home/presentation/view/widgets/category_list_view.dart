import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/manger_model/categores_cubit/categores_cubit.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/category_item.dart';

import '../../../../../core/widgets/coustem_feature_failler.dart';
import '../../../../../core/widgets/coustem_loading_indecator.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoresCubit, CategoresState>(
      builder: (context, state) {
        if (state is CategoresSucess) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5, // المسافة الأفقية بين العناصر
              mainAxisSpacing: 4, // المسافة الرأسية بين العناصر
              childAspectRatio: 1 / 1.4,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CategoryItem(
                  urlImage:
                      state.categores[index].imagePath ??
                      'https://tse1.mm.bing.net/th/id/OIP.j1sMPSP-emIbWhpgbf50zQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
                  name: state.categores[index].name,
                ),
              );
            },
          );
        } else if (state is CategoreFailer) {
          return CoustemFeatureFailler(errorMassge: state.errorMassge);
        } else {
          return CoustemLoadingIndecator();
        }
      },
    );
  }
}

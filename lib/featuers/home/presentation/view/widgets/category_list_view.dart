import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5, // المسافة الأفقية بين العناصر
        mainAxisSpacing: 4, // المسافة الرأسية بين العناصر
        childAspectRatio: 1/1.4 ,
      ),
      itemCount: 6,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0,),
          child: CategoryItem(),
        );
      },
    );
  }
}

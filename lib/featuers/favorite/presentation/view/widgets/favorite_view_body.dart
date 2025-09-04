import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_prodect_item.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              ProudctAbbBar(titel: 'Favorits',),
              SizedBox(height: 20,),
              Expanded(
                child: GridView.builder(
                  itemCount: 20,
                  
                  itemBuilder: (context, index) {
                    // return CoustemProdectItem();
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  
  }
}
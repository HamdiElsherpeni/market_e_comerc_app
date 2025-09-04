import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/coustem_prodect_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,

      itemBuilder: (context, index) {
        return CoustemProdectItem(
          image:
              "https://www.brainpulse.com/wp-content/uploads/2021/02/image-search.jpg",
          name: "name",
          price: 250, id:'',
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
    
  }
}

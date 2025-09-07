import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/cart/presentation/view/widgets/cart_view_body.dart';
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: CartViewBody()),);
  }
}
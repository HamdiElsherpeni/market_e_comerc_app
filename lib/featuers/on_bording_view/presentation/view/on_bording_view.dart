import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/on_bording_view/presentation/view/widgets/on_bording_view_body.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: OnBordingViewBody()),);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/sinup_cubit/sin_up_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/sinup_view_body.dart';

class SinupView extends StatelessWidget {
  const SinupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SinupViewBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/my_brofile/presentation/view/widgets/my_profile_view_body.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: MyProfileViewBody()),);
  }
}
import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/featuers/login_and_sinup/presentation/view/widgets/login_view_body.dart';

class LoginVew extends StatelessWidget {
  const LoginVew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LoginViewBody()));
  }
}

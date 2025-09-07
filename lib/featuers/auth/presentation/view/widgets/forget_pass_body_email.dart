import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/reset_pass_cubit/reset_pass_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coustem_text_form_feaild.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coutem_app_bar_forget.dart';

class ForgetPassBodyEmail extends StatelessWidget {
  ForgetPassBodyEmail({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailControler = TextEditingController();
  void _resetPass(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ResetPassCubit>().ResetPassByEmail(
        email: _emailControler.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
                  CoutemAppBarForget(text: 'Forget Password',),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
              
                      children: [
                        SizedBox(height: 30),
                        SizedBox(
                          height: 200,
                          child: Image.asset(AppAssets.forgetPass),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            'Please enter your email address to\nreceive a verification code',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              
                        CoustemTextFormFeaild(
                          preIcon: Icon(Icons.email_outlined),
                          txtHint: 'You@gmail.com',
                          controller: _emailControler,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Enter your email";
                            }
                            if (!val.contains("@")) return "Enter valid email";
                            return null;
                          },
                        ),
                        SizedBox(height: 18),
                        BlocConsumer<ResetPassCubit, ResetPassState>(
                          listener: (context, state) {
                            if (state is ResetPassSucsess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(" تم التسجيل بنجاح  ✅"),
                                ),
                              );
                              GoRouter.of(context).pushReplacement(
                                AppRouter.KOtpView,
                                extra:  _emailControler.text.trim(),
                              );
                            } else if (state is ResetPassFalier) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.errorMassge),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is ResetPassLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return CoustemElvetedBoutten(
                              text: 'Sent Code',
                              onPressed: () => _resetPass(context),
                            );
                          },
                        ),
              
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_avatar.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/sinin_cubit/sin_in_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coustem_text_form_feaild.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  bool isCheckd = false;
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscure = true;

  void _onSignIn(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SinInCubit>().sinInFeatureCu(
        password: _passwordController.text.trim(),
        email: _emailControler.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 53,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: BoxBorder.all(
                    color: const Color.fromARGB(255, 157, 202, 239),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.KHomeView);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: KprimaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 178,
                  child: Image.asset(AppAssets.logoSplash),
                ),
              ),
              SizedBox(height: 20),
          
              CoustemTextFormFeaild(
                preIcon: Icon(Icons.email_outlined, size: 17),
                txtHint: "Username or email",
                controller: _emailControler,
                validator: (val) {
                  if (val == null || val.isEmpty) return "Enter your email";
                  if (!val.contains("@")) return "Enter valid email";
                  return null;
                },
              ),
              SizedBox(height: 15),
              CoustemTextFormFeaild(
                preIcon: Icon(Icons.lock_outline, size: 17),
                txtHint: "**************",
                controller: _passwordController,
                obscureText: _isPasswordObscure,
                sufIcon: IconButton(
                  icon: Icon(
                    _isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                    size: 17,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordObscure = !_isPasswordObscure;
                    });
                  },
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Password is required";
                  }
                  if (val.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(val)) {
                    return "Password must contain at least one uppercase letter";
                  }
                  if (!RegExp(r'[a-z]').hasMatch(val)) {
                    return "Password must contain at least one lowercase letter";
                  }
                  if (!RegExp(r'[0-9]').hasMatch(val)) {
                    return "Password must contain at least one number";
                  }
                  return null;
                },
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                        width: 28,
                        child: Checkbox(
                          value: isCheckd,
                          onChanged: (value) {
                            setState(() {
                              isCheckd = value!;
                            });
                          },
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                        ),
                      ),
                      Text('Remmember Me', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.KForgetpassPhonnum);
                    },
                    child: Text(
                      'Forget Password',
                      style: TextStyle(color: KprimaryColor, fontSize: 10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              BlocConsumer<SinInCubit,SinInState>(
                listener: (context, state) {
                  if (state is SinInSucsess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(" تم التسجيل بنجاح  ✅")),
                    );
                   
                    GoRouter.of(context).pushReplacement(AppRouter.KHomeView);
                  } else if (state is SinInFailer) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMassge),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SinInILiading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CoustemElvetedBoutten(
                    text: "Sign Up",
                    onPressed: () => _onSignIn(context),
                  );
                },
              ),
              SizedBox(height: 5),
          
              Center(
                child: Text(
                  'Or Continue With',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: 5),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CoustemCircleAvatar(
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 10),
          
                  CoustemCircleAvatar(
                    icon: Icon(Icons.apple, color: Colors.black, size: 20),
                  ),
                  SizedBox(width: 10),
          
                  CoustemCircleAvatar(
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Are you new in Marketi',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.KSinUp);
                    },
                    child: Text(
                      'register?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: KprimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

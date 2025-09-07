import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_avatar.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/sinup_cubit/sin_up_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coustem_text_form_feaild.dart';

class SinupViewBody extends StatefulWidget {
  const SinupViewBody({super.key});

  @override
  State<SinupViewBody> createState() => _SinupViewBodyState();
}

class _SinupViewBodyState extends State<SinupViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  

  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  void _onSignUp(BuildContext context) async{
    if (_formKey.currentState!.validate()) {
      context.read<SinUpCubit>().sinupFuture(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
   

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoustemCircleAvatar(
                      icon: const Icon(FontAwesomeIcons.arrowLeft),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 25),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.19,
                      child: Image.asset(AppAssets.logoSplash),
                    ),
                  ],
                ),
            
                // 🔹 Name
                const Text(
                  "Your name",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                CoustemTextFormFeaild(
                  preIcon: const Icon(Icons.person_outline_outlined),
                  txtHint: 'Full Name',
                  controller: nameController,
                  validator: (val) =>
                      val == null || val.isEmpty ? "Enter your name" : null,
                ),
            
                // 🔹 Username
                const Text(
                  "User name",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                CoustemTextFormFeaild(
                  preIcon: const Icon(Icons.person_outline_outlined),
                  txtHint: 'Username',
                  controller: usernameController,
                  validator: (val) =>
                      val == null || val.isEmpty ? "Enter a username" : null,
                ),
            
                // 🔹 Phone
                const Text(
                  "Phone number",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                CoustemTextFormFeaild(
                  preIcon: const Icon(Icons.phone_iphone_outlined),
                  txtHint: '+20 1501142409 ',
                  controller: phoneController,
                  validator: (val) =>
                      val == null || val.isEmpty ? "Enter phone number" : null,
                ),
            
                // 🔹 Email
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                CoustemTextFormFeaild(
                  preIcon: const Icon(Icons.email_outlined),
                  txtHint: 'You@gmail.com',
                  controller: emailController,
                  validator: (val) {
                    if (val == null || val.isEmpty) return "Enter your email";
                    if (!val.contains("@")) return "Enter valid email";
                    return null;
                  },
                ),
            
                // 🔹 Password
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                CoustemTextFormFeaild(
                  preIcon: const Icon(Icons.lock_outline_rounded),
                  txtHint: '****************',
                  controller: passwordController,
                  obscureText: _isPasswordObscure,
                  sufIcon: IconButton(
                    icon: Icon(
                      _isPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
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
            
                // 🔹 Confirm Password
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                CoustemTextFormFeaild(
                  preIcon: const Icon(Icons.lock_outline_rounded),
                  txtHint: '****************',
                  controller: confirmPasswordController,
                  obscureText: _isConfirmPasswordObscure,
                  sufIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 17,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
                      });
                    },
                  ),
                  validator: (val) => val != passwordController.text
                      ? "Passwords do not match"
                      : null,
                ),
            
                const SizedBox(height: 15),
            
                // 🔹 زرار التسجيل مع Bloc
                BlocConsumer<SinUpCubit, SinUpState>(
                  listener: (context, state) {
                    if (state is SinUpISucsess) {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            " تم التسجيل بنجاح اذهب وفعل الايميل لتسجيل الدخول ✅",
                          ),
                        ),
                      );
                      GoRouter.of(context).pushReplacement(AppRouter.KlogIn);
                    } else if (state is SinUpIFailer) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMassge),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SinUpILoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CoustemElvetedBoutten(
                      text: "Sign Up",
                      onPressed: () => _onSignUp(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

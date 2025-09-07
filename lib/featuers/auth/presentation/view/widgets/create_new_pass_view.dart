import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/create_new_pass_cubit/creat_new_pass_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/manger/sinup_cubit/sin_up_cubit.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coustem_text_form_feaild.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coutem_app_bar_forget.dart';

class CreateNewPassView extends StatefulWidget {
  const CreateNewPassView({super.key, required this.email});
  final String email;
  @override
  State<CreateNewPassView> createState() => _CreateNewPassViewState();
}

class _CreateNewPassViewState extends State<CreateNewPassView> {
  bool _isPasswordObscure = true;

  bool _isConfirmPasswordObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  void _cretenewpass(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<CreatNewPassCubit>().futureCreaetNewPss(
        email: widget.email,
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoutemAppBarForget(text: 'Create New Password'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Image.asset(AppAssets.otpImage, height: 150),
                      const SizedBox(height: 20),
                      const Text(
                        "New password must be\ndifferent from last password",
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
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
                SizedBox(height: 10),
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
                SizedBox(height: 10,),
                BlocConsumer<CreatNewPassCubit, CreatNewPassState>(
                  listener: (context, state) {
                    if (state is CreatNewPassISucess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("✅Reset New Psss Sucsessfuly"),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // تروح لصفحة reset password
                      GoRouter.of(context).push(AppRouter.KConcrats);
                    } else if (state is CreatNewPassFalier) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMassge),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is CreatNewPassLoadingl) {
                      return Center(child: const CircularProgressIndicator());
                    }
                    return ElevatedButton(
                      onPressed: () => _cretenewpass(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text("Verify Code"),
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

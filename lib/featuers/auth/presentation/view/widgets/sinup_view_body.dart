import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_avatar.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/featuers/auth/data/services/auth_services.dart';
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

  AuthServices authServices = AuthServices();

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      // ✅ هنا البيانات مظبوطة
      final response = await authServices.signUp(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      );

      print("📌 Response: $response");
      // تقدر تعمل SnackBar أو تنقل شاشة
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoustemCircleAvatar(
                    icon: Icon(FontAwesomeIcons.arrowLeft),
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
              Text("Your name", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              CoustemTextFormFeaild(
                preIcon: Icon(Icons.person_outline_outlined),
                txtHint: 'Full Name',
                controller: nameController,
                validator: (val) =>
                    val == null || val.isEmpty ? "Enter your name" : null,
              ),

              // 🔹 Username
              Text("User name", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              CoustemTextFormFeaild(
                preIcon: Icon(Icons.person_outline_outlined),
                txtHint: 'Username',
                controller: usernameController,
                validator: (val) =>
                    val == null || val.isEmpty ? "Enter a username" : null,
              ),

              // 🔹 Phone
              Text("Phone number", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              CoustemTextFormFeaild(
                preIcon: Icon(Icons.phone_iphone_outlined),
                txtHint: '+20 1501142409 ',
                controller: phoneController,
                validator: (val) =>
                    val == null || val.isEmpty ? "Enter phone number" : null,
              ),

              // 🔹 Email
              Text("Email", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              CoustemTextFormFeaild(
                preIcon: Icon(Icons.email_outlined),
                txtHint: 'You@gmail.com',
                controller: emailController,
                validator: (val) {
                  if (val == null || val.isEmpty) return "Enter your email";
                  if (!val.contains("@")) return "Enter valid email";
                  return null;
                },
              ),

              // 🔹 Password
              Text("Password", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              CoustemTextFormFeaild(
                preIcon: Icon(Icons.lock_outline_rounded),
                txtHint: '****************',
                sufIcon: Icon(Icons.visibility_off, size: 17),
                controller: passwordController,
                validator: (val) =>
                    val != null && val.length < 6 ? "Password too short" : null,
              ),

              // 🔹 Confirm Password
              Text("Confirm Password", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              CoustemTextFormFeaild(
                preIcon: Icon(Icons.lock_outline_rounded),
                txtHint: '****************',
                sufIcon: Icon(Icons.visibility_off, size: 17),
                controller: confirmPasswordController,
                validator: (val) => val != passwordController.text
                    ? "Passwords do not match"
                    : null,
              ),

              SizedBox(height: 15),

              // 🔹 Button
              CoustemElvetedBoutten(
                text: "Sign Up",
                onPressed: _signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

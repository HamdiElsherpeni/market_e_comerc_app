import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_avatar.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coustem_text_form_feaild.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isCheckd = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          ),
          SizedBox(height: 15),
          CoustemTextFormFeaild(
            preIcon: Icon(Icons.lock_outline, size: 17),
            txtHint: "**************",
            sufIcon: Icon(Icons.visibility_off, size: 17),
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
          CoustemElvetedBoutten(text: 'Log in'),
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
    );
  }
}

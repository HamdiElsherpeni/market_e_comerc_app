import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coustem_text_form_feaild.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coutem_app_bar_forget.dart';

class ForgetPassBodyEmail extends StatelessWidget {
  const ForgetPassBodyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CoutemAppBarForget(),
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
                    ),
                    SizedBox(height: 18),
                    CoustemElvetedBoutten(text: 'Sent Code'),
                   
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

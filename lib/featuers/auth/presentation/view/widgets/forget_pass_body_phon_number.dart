import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coustem_text_form_feaild.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coutem_app_bar_forget.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      'Please enter your phone number to\nreceive a verification code',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  CoustemTextFormFeaild(
                    preIcon: Icon(Icons.phone_iphone_outlined),
                    txtHint: '+20 1501142409 ',
                  ),
                  SizedBox(height: 18),
                  CoustemElvetedBoutten(text: 'Sent Code'),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.KForgetpassEmail);
                      },
                      child: Text(
                        'Try Another Way',
                        style: TextStyle(color: KprimaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/function/app_assets.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_avatar.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_elveted_boutten.dart';
import 'package:market_e_comerc_app/featuers/login_and_sinup/presentation/view/widgets/coustem_text_form_feaild.dart';

class SinupViewBody extends StatelessWidget {
  const SinupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
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
            Text(
              'Your name',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            CoustemTextFormFeaild(
              preIcon: Icon(Icons.person_outline_outlined),
              txtHint: 'Full Name',
            ),
            Text(
              'user name',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),

            CoustemTextFormFeaild(
              preIcon: Icon(Icons.person_outline_outlined),
              txtHint: 'Username',
            ),
            Text(
              'Fone number',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),

            CoustemTextFormFeaild(
              preIcon: Icon(Icons.phone_iphone_outlined),
              txtHint: '+20 1501142409 ',
            ),
            Text(
              'Email',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),

            CoustemTextFormFeaild(
              preIcon: Icon(Icons.email_outlined),
              txtHint: 'You@gmail.com',
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),

            CoustemTextFormFeaild(
              preIcon: Icon(Icons.lock_outline_rounded),
              txtHint: '****************',
              sufIcon:  Icon(Icons.visibility_off,size: 17,),
            ),
            Text(
              'Confarem Password',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            CoustemTextFormFeaild(  preIcon: Icon(Icons.lock_outline_rounded),
              txtHint: '****************',
              sufIcon: Icon(Icons.visibility_off,size: 17,),
           ),

            SizedBox(height: 15),
            CoustemElvetedBoutten(text: "Sing Up"),
            SizedBox(height: 5),

            Align(
              alignment: Alignment.center,
              child: Text(
                'Or Continue With',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoustemCircleAvatar(
                  icon: Icon(FontAwesomeIcons.google, color: Colors.black),
                ),
                SizedBox(width: 10),
                CoustemCircleAvatar(
                  icon: Icon(FontAwesomeIcons.apple, color: Colors.black),
                ),
                SizedBox(width: 10),

                CoustemCircleAvatar(
                  icon: Icon(FontAwesomeIcons.facebookF, color: Colors.black),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.006,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

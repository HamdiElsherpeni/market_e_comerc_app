
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/core/utlis/shared_preferences.dart';
import 'package:market_e_comerc_app/core/widgets/proudct_abb_bar.dart';
import 'package:market_e_comerc_app/featuers/auth/presentation/view/widgets/coustem_text_form_feaild.dart';

class SaerchViewBody extends StatelessWidget {
  const SaerchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
      print("TOKEN: ${SharedPreferenceManager.getToken()}");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              ProudctAbbBar(titel: ''),
              SizedBox(height: 10),
              CoustemTextFormFeaild(
                
                preIcon: const Icon(
                  FontAwesomeIcons.search,
                  size: 20,
                  weight: 200,
                  
                ),
                sufIcon: Icon(
                  Icons.format_list_bulleted_sharp,
                  color: KprimaryColor,
                ),
                txtHint: 'What are you looking for ? ',
                
                
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

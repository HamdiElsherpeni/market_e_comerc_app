import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/app_styls.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_image.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/cirecle_arow_boutten.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/coustem_abb_bar_my_profile.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/coustem_profile_image.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/coustem_user_detiles.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/swich_boutten.dart';

class MyProfileViewBody extends StatefulWidget {
  MyProfileViewBody({super.key});

  @override
  State<MyProfileViewBody> createState() => _MyProfileViewBodyState();
}

class _MyProfileViewBodyState extends State<MyProfileViewBody> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CoustemAbbBarMyProfile(),
          CoustemUserDetiles(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_2_outlined),
                      SizedBox(width: 10),
                      Text(
                        'Account Preferences',
                        style: AppStyls.textStyle17.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  CircleArrowButton(onPressed: () {}),
                ],
              ),
              Divider(indent: 5, endIndent: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.payment_outlined),
                      SizedBox(width: 10),
                      Text(
                        'Subscription & Payment',
                        style: AppStyls.textStyle17.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  CircleArrowButton(onPressed: () {}),
                ],
              ),
              Divider(indent: 5, endIndent: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notifications_none),
                      SizedBox(width: 10),
                      Text(
                        'App Notifications',
                        style: AppStyls.textStyle17.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  SwichBoutten(),
                ],
              ),
              Divider(indent: 5, endIndent: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.dark_mode_outlined),
                      SizedBox(width: 10),
                      Text(
                        'Dark Mode',
                        style: AppStyls.textStyle17.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  SwichBoutten(),
                ],
              ),
              Divider(indent: 5, endIndent: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star_border),
                      SizedBox(width: 10),
                      Text(
                        'Rate Us',
                        style: AppStyls.textStyle17.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  CircleArrowButton(onPressed: () {}),
                ],
              ),
              Divider(indent: 5, endIndent: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.feedback_outlined),
                      SizedBox(width: 10),
                      Text(
                        'Provide Feedback',
                        style: AppStyls.textStyle17.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  CircleArrowButton(onPressed: () {}),
                ],
              ),
              Divider(indent: 5, endIndent: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red),
                      SizedBox(width: 10),
                      Text(
                        'Log Out',
                        style: AppStyls.textStyle17.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  CircleArrowButton(onPressed: () {}),
                ],
              ),
             
            ],
          ),
        ],
      ),
    );
  }
}

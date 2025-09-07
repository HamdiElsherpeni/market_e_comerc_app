


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_router.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/coustem_profile_image.dart';

import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/shared_preferences.dart';

class CoustemUserDetiles extends StatelessWidget {
  const CoustemUserDetiles({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        SharedPreferenceManager.getName(),
        SharedPreferenceManager.getUserName(),
      ]),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        String? name = snapshot.data![0];
        String? userName = snapshot.data![1];

        return SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CoustemProfileImage(urlImage: AppAssets.hamdi),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: IconButton(
                        onPressed: () {

                      GoRouter.of(context).push(AppRouter.KEditUserData);

                        },
                        icon: Icon(Icons.edit, size: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                name ?? "Guest",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Opacity(
                opacity: 0.5,
                child: Text(
                  "@${userName ?? "Unknown"}",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

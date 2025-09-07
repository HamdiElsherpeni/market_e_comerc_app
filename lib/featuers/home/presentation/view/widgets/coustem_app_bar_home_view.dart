import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_e_comerc_app/constant.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/shared_preferences.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_image.dart';

class CoustemAppBarHomeView extends StatelessWidget {
  const CoustemAppBarHomeView({super.key, this.urlImage});
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SharedPreferenceManager.getName(),
      builder: (context, snapshot) {
        final name = snapshot.data;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CoustemCircleImage(urlImage: urlImage ?? AppAssets.hamdi),
                SizedBox(width: 5),
                Text(
                  'Hi ${name ?? 'SinIn !'}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined, color: KprimaryColor),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_avatar.dart';
import 'package:market_e_comerc_app/core/widgets/coustem_circle_image.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/menu_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CoustemCircleImage(urlImage: AppAssets.hamdi),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wellcome,',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text('$name', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(
                    FontAwesomeIcons.close,
                    size: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              MenuWidget(
                icon: Icon(FontAwesomeIcons.refresh, size: 15),
                text: 'Buy Again',
              ),
              SizedBox(height: 10),
              MenuWidget(
                icon: Icon(Icons.shopping_bag_outlined, size: 15),
                text: 'My Orders',
              ),
              SizedBox(height: 10),
              MenuWidget(
                icon: Icon(Icons.payment_outlined, size: 15),
                text: 'Payments',
              ),
              SizedBox(height: 10),
              MenuWidget(
                icon: Icon(Icons.settings_outlined, size: 15),
                text: 'Account Settings',
              ),
              SizedBox(height: 10),
               MenuWidget(
                icon: Icon(Icons.support_agent_outlined, size: 15),
                text: 'Support',
              ),
              SizedBox(height: 10),

            ],
          ),
        ),
      ],
    );
  }
}

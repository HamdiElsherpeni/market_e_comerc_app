import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/coustem_profile_image.dart';

class CoustemUserDetiles extends StatelessWidget {
  const CoustemUserDetiles({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CoustemProfileImage(urlImage: AppAssets.hamdi),
              Positioned(
                right:0,
                bottom:0,
                child: CircleAvatar(backgroundColor: Colors.white,radius: 12,child: IconButton(onPressed: () {}, icon: Icon(Icons.edit,size: 10,))),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Hamdi Elshserpeni',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Opacity(
            opacity: 0.5,
            child: Text(
              '@Hamdi Elshserpeni',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

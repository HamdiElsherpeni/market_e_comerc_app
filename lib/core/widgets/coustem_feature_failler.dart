import 'package:flutter/material.dart';
import 'package:market_e_comerc_app/core/utlis/app_styls.dart';


class CoustemFeatureFailler extends StatelessWidget {
   const CoustemFeatureFailler({super.key, required this.errorMassge});
final String errorMassge;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMassge,style:AppStyls.textStyle12,));
  }
}
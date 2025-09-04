import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';

import 'package:market_e_comerc_app/featuers/home/data/models/populer_model/populer_product.dart';
import 'package:market_e_comerc_app/featuers/home/presentation/view/widgets/popouler_product_view.dart';

abstract class PopulerRepo {
  Future<Either<ServerFailler,List<PopulerModel>>>futurePopuler();
}
import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';

import 'package:market_e_comerc_app/featuers/home/data/models/populer_model/populer_product.dart';

abstract class PopulerRepo {
  Future<Either<ServerFailler,List<PopulerModel>>>futurePopuler();
}
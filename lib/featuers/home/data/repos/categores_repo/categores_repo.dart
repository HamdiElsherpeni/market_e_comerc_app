import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/categores_model/categores.model.dart';

abstract class CategoresRepo {
  Future<Either<ServerFailler,List<CategoresModel>>>futureGetBrands();
}
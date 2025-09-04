import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/prands_model/brands.model.dart';

abstract class BrandsRepo {

  Future<Either<ServerFailler,List<BrandsModel>>>futureGetBrands();
}
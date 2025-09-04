import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/top_search_model/top_search.model.dart';

abstract class TopSaerchRepo {
  Future<Either<ServerFailler,List<TopSearch>>>futureTopSearch();
}
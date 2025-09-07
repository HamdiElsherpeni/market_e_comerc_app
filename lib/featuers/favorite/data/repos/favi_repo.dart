// lib/featuers/favorite/data/repos/favi_repo.dart
import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/add_favi/add_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/delet_favi/delet_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/get_favi_product/get_favi_response.dart';


abstract class FaviRepo {
  Future<Either<ServerFailler, AddFaviResponse>> futureAddProduct({
    required String productId,
  });
  Future<Either<ServerFailler, DeletFaviResponse>> futureDeletProduct({
    required String productId,
  });
  Future<Either<ServerFailler, List<GetFaviResponse>>> futureGetFavitProduct();
}

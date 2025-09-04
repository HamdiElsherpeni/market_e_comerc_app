import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';

import 'package:market_e_comerc_app/featuers/home/data/home_service/home_services.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/populer_model/populer_product.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/populer_repo/populer_repo.dart';

class PopulerRepoImplement extends PopulerRepo {
  final HomeServices homeServices;

  PopulerRepoImplement(this.homeServices);
  @override
  Future<Either<ServerFailler, List<PopulerModel>>> futurePopuler() async {
    try {
      var result = await homeServices.getProducts();
      List<PopulerModel> products = [];
      for (var element in result['list']) {
        products.add(PopulerModel.fromJson(element));
      }
      return right(products);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailler.fromDioError(e));
      } else {
        return left(ServerFailler(e.toString()));
      }
    }
  }
}

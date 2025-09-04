import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/home/data/home_service/home_services.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/categores_model/categores.model.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/categores_repo/categores_repo.dart';

class CategoresRepoImpelement extends CategoresRepo {
  final HomeServices homeServices;

  CategoresRepoImpelement(this.homeServices);

  @override
  Future<Either<ServerFailler, List<CategoresModel>>> futureGetBrands() async {
    try {
      var result = await homeServices.getBrands();
      List<CategoresModel> brands = [];
      for (var element in result['list']) {
        brands.add(CategoresModel.fromJson(element));
      }
      return right(brands);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailler.fromDioError(e));
      } else {
        return left(ServerFailler(e.toString()));
      }
    }
  }
}

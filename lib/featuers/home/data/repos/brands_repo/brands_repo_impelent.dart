import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/home/data/home_service/home_services.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/prands_model/brands.model.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/brands_repo/brands_repo.dart';

class BrandsRepoImpelent extends BrandsRepo{
final  HomeServices homeServices;

  BrandsRepoImpelent(this.homeServices);
  @override
  Future<Either<ServerFailler, List<BrandsModel>>> futureGetBrands()async {
    try {
      var result = await homeServices.getBrands();
      List<BrandsModel> brands = [];
      for (var element in result['list']) {
        brands.add(BrandsModel.fromJson(element));
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
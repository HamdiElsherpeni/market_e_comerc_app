import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/home/data/home_service/home_services.dart' show HomeServices;
import 'package:market_e_comerc_app/featuers/home/data/models/top_search_model/top_search.model.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/top_search_repo/top_saerch_repo.dart';

class TomSearchImplement  extends TopSaerchRepo{
  final HomeServices homeServices;

  TomSearchImplement(this.homeServices);
  @override
  Future<Either<ServerFailler, List<TopSearch>>> futureTopSearch() async{
   try {
      var result = await homeServices.getProducts();
      List<TopSearch> products = [];
      for (var element in result['list']) {
        products.add(TopSearch.fromJson(element));
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
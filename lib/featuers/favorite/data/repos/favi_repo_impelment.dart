import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/add_favi/add_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/delet_favi/delet_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/get_favi_product/get_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/repos/favi_repo.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/services_favi/services_favi.dart';

class FaviRepoImpelment extends FaviRepo {
  final ServicesFavi servicesFavi;

  FaviRepoImpelment(this.servicesFavi);
  @override
  Future<Either<ServerFailler, AddFaviResponse>> futureAddProduct({
    required String productId,
  }) async {
    try {
      var response = await servicesFavi.addFvieProduct(productId: productId);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailler.fromDioError(e));
      } else {
        return left(ServerFailler(e.toString()));
      }
    }
  }

  @override
  Future<Either<ServerFailler, DeletFaviResponse>> futureDeletProduct({
    required String productId,
  }) async {
    try {
      var response = await servicesFavi.deletFvieProduct(productId: productId);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailler.fromDioError(e));
      } else {
        return left(ServerFailler(e.toString()));
      }
    }
  }

  @override
  Future<Either<ServerFailler, List<GetFaviResponse>>> futureGetFavitProduct()async {
   try {
      var response = await servicesFavi.getFavi(); // هنا هترجع Map من السيرفس
      List<GetFaviResponse> products = [];

      for (var element in response['list']) {
        products.add(GetFaviResponse.fromJson(element));
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

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/cart/data/cart_services/cart_services.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/add/addprudut_cart_respons.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/delet_product_model/delet_respons.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/get_cart/get_cart_response.dart';
import 'package:market_e_comerc_app/featuers/cart/data/repos/cart_repo.dart';

class CartRepoImplementation extends CartRepo {
  final CartServices cartServices;

  CartRepoImplementation(this.cartServices);
  @override
  Future<Either<ServerFailler, AddToCartResponse>> futureAddProduct({
    required String productId,
  }) async {
    try {
      var response = await cartServices.addToCart(productId: productId);

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
  Future<Either<ServerFailler, DeletRespons>> futureDeletProduct({
    required String productId,
  }) async {
    try {
      var response = await cartServices.deleteFromCart(productId: productId);
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
  Future<Either<ServerFailler, List<GetCartResponse>>>
  futureGetCartProduct() async {
    try {
      var response = await cartServices.getCart(); // هنا هترجع Map من السيرفس
      List<GetCartResponse> products = [];

      for (var element in response['list']) {
        products.add(GetCartResponse.fromJson(element));
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

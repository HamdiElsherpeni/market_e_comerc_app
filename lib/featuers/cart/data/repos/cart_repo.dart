import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/add/addprudut_cart_respons.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/delet_product_model/delet_respons.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/get_cart/get_cart_response.dart';

import '../../../../core/err/faire.dart';
import '../../../home/data/models/prands_model/brands.model.dart';

abstract class CartRepo {
  Future<Either<ServerFailler, AddToCartResponse>> futureAddProduct({
    required String productId,
  });
  Future<Either<ServerFailler, DeletRespons>> futureDeletProduct({
    required String productId,
  });
  Future<Either<ServerFailler, List<GetCartResponse>>> futureGetCartProduct();
}

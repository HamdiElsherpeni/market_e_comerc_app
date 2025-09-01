import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/sinin_model/sin_in_response.dart';

abstract class SininRepo {
  Future<Either<ServerFailler, SignInResponse>> featuresinInUser({
    required String email,
    required String password,
  });
}

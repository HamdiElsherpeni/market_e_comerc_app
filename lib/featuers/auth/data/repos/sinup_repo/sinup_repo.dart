import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/sinup_models/sin_uo_response.dart';

abstract class SinupRepo {
  Future<Either<ServerFailler,SinUPResponse>>sinUpUser({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
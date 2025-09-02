import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/active_reset_password/active_reset_password_request.dart';

abstract class ActiveResetRepo {
  Future<Either<ServerFailler, ActiveResetModelResponse>> resetPassword({
    required String email,
    required String code,

  });
}
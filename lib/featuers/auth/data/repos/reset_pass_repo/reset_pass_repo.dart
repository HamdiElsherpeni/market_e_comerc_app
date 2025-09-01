import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/reset_password_by_email_model/reset_pass_response.dart';

abstract class ResetPassRepo {
  Future<Either<ServerFailler, ResetPassResponse>> resetPassword({
    required String email,
  });
}

import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/create_new_pass_model/create_new_pass_response.dart';

abstract class CreateNewPassRepo {
  Future<Either<ServerFailler, CreateNewPassResponse>> futureCreaetNewPss({
    required String email,
    required String password,
    required String confirmPassword,
  });
}

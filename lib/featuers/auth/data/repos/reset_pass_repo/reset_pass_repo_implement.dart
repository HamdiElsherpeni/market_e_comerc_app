import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/reset_password_by_email_model/reset_pass_response.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/reset_pass_repo/reset_pass_repo.dart';
import 'package:market_e_comerc_app/featuers/auth/data/services/auth_services.dart';

class ResetPassRepoImplement extends ResetPassRepo {
  final AuthServices authServices;

  ResetPassRepoImplement({required this.authServices});
  @override
  Future<Either<ServerFailler, ResetPassResponse>> resetPassword({
    required String email,
  }) async {
    try {
      var response = await authServices.sendResetPasswordEmail(email);
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailler.fromDioError(e));
    } catch (e) {
      return left(ServerFailler(e.toString()));
    }
  }
}

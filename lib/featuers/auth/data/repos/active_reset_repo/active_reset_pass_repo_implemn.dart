import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/active_reset_password/active_reset_password_request.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/active_reset_repo/active_reset_repo.dart';
import 'package:market_e_comerc_app/featuers/auth/data/services/auth_services.dart';

class ActiveResetPassRepoImplemn extends ActiveResetRepo {
  final AuthServices authServices;

  ActiveResetPassRepoImplemn(this.authServices);
  @override
  Future<Either<ServerFailler, ActiveResetModelResponse>> resetPassword({
    required String email,
    required String code,
  }) async {
    try {
      var result = await authServices.activateResetPassword(
        email: email,
        code: code,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailler.fromDioError(e));
    } catch (e) {
      return left(ServerFailler(e.toString()));
    }
  }
}

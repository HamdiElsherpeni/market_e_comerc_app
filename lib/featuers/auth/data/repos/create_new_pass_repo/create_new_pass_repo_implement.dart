import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/create_new_pass_model/create_new_pass_response.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/create_new_pass_repo/create_new_pass_repo.dart';
import 'package:market_e_comerc_app/featuers/auth/data/services/auth_services.dart';

class CreateNewPassRepoImplement extends CreateNewPassRepo {
  final AuthServices authServices;

  CreateNewPassRepoImplement(this.authServices);
  @override
  Future<Either<ServerFailler, CreateNewPassResponse>> futureCreaetNewPss({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var response = await authServices.createNewPassword(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailler.fromDioError(e));
    } catch (e) {
      return left(ServerFailler(e.toString()));
    }
  }
}

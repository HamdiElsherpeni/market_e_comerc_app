import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/sinin_model/sin_in_response.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinin_repo/sinin_repo.dart';
import 'package:market_e_comerc_app/featuers/auth/data/services/auth_services.dart';

class SininRepoImplement extends SininRepo {
  final AuthServices authServices;

  SininRepoImplement(this.authServices);
  @override
  Future<Either<ServerFailler, SignInResponse>> featuresinInUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authServices.signInUser(email, password);
     return right(response);
    } on DioException catch (e) {
      return left(ServerFailler.fromDioError(e));
    } catch (e) {
      return left(ServerFailler(e.toString()));
    }
  }
}

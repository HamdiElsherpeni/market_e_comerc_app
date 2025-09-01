import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/sinup_models/sin_uo_response.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinup_repo/sinup_repo.dart';
import 'package:market_e_comerc_app/featuers/auth/data/services/auth_services.dart';

class SinupRepoImpelemnt extends SinupRepo {
  final AuthServices authServices;

  SinupRepoImpelemnt(this.authServices);

  @override
  Future<Either<ServerFailler, SinUPResponse>> sinUpUser({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await authServices.signUp(
        name: name,
        phone: phone,
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

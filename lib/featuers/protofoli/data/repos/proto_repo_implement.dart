// lib/featuers/protofoli/data/repos/proto_repo_implement.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/protofoli/data/models/update_user_data/update_user_response.dart';
import 'package:market_e_comerc_app/featuers/protofoli/data/repos/porto_repo.dart';
import 'package:market_e_comerc_app/featuers/protofoli/data/services/protofolio_service.dart';

class ProtoRepoImplement extends PortoRepo {
  final ProtofolioService protofolioService;

  ProtoRepoImplement(this.protofolioService);

  @override
  Future<Either<ServerFailler, UpdateUserResponse>> ftchUpDateDta({
    required String name,
    required String email,
    required String gender,
    required String type,
    required String address,
    required String phone,
  }) async {
    try {
      final result = await protofolioService.editUserData(
        name: name,
        email: email,
        gender: gender,
        type: type,
        address: address,
        phone: phone,
      );
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailler.fromDioError(e));
    } catch (e) {
      return left(ServerFailler(e.toString()));
    }
  }
}

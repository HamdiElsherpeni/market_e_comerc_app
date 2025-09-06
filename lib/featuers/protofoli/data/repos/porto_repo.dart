import 'package:dartz/dartz.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/protofoli/data/models/update_user_data/update_user_response.dart';

abstract class PortoRepo {
  Future<Either<ServerFailler,UpdateUserResponse>>ftchUpDateDta();
}
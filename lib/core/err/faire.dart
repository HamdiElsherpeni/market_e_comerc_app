import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failler {
  Failler(this.errorMassge);

  final String errorMassge;
}

class ServerFailler extends Failler {
  ServerFailler(super.errorMassge);

  factory ServerFailler.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailler('Conniction timeOut with ApiServier');
      case DioExceptionType.sendTimeout:
        return ServerFailler('Sending timeOut with ApiServier');

      case DioExceptionType.receiveTimeout:
        return ServerFailler('Reciving timeOut with ApiServier');

      case DioExceptionType.badCertificate:
        return ServerFailler('Bad certificate error');
      case DioExceptionType.badResponse:
        final response = dioError.response;
        if (response != null && response.statusCode != null) {
          return ServerFailler.fromResponse(
            response.statusCode!,
            response.data,
          );
        } else {
          return ServerFailler('Received an invalid response from the server');
        }

      case DioExceptionType.cancel:
        return ServerFailler('Your requset is cancelled');
      case DioExceptionType.connectionError:
        return ServerFailler('check your network and try agin!');

      case DioExceptionType.unknown:
        return ServerFailler('Oops ther was an error,try agin leater');

      default:
        return ServerFailler('Unexpected error, please try again later');
    }
  }
  factory ServerFailler.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailler(response['message']);
    } else if (statusCode == 404) {
      return ServerFailler('Your not found, please try again');
    } else if (statusCode == 500) {
      return ServerFailler('Internal Server Error, please try agin leater ');
    } else {
      return ServerFailler('Oops ther was an error,try agin leater');
    }
  }
}

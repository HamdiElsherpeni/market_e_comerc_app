import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:market_e_comerc_app/core/utlis/api_constant.dart';
import 'package:market_e_comerc_app/core/utlis/shared_preferences.dart';

class HomeServices {
  final Dio _dio = Dio();

  HomeServices() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      
      ),
    );
  }

  Future<Map<String, dynamic>> getProducts() async {
    final token = await SharedPreferenceManager.getToken();
    print(token);
    var headers = {
      'Content-Type': 'application/json',
'Authorization': 'Bearer $token',
    };

    var queryParams = {
      "skip": "",
      "search": "",
      "brand": "",
      "category": "",
      "rating": "",
      "price": "",
      "discount": "",
      "popular": "",
    };

    final response = await _dio.get(
      ApiConstant.products,
      options: Options(headers: headers),
      queryParameters: queryParams,
    );

    return response.data;
  }

  Future<Map<String, dynamic>> getBrands() async {
    final token = await SharedPreferenceManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
'Authorization': 'Bearer $token',
    };

    var queryParams = {"name": ""};

    final response = await _dio.get(
      ApiConstant.brands,
      options: Options(headers: headers),
      queryParameters: queryParams,
    );

    return response.data;
  }

  Future<Map<String, dynamic>> getCategories() async {
    final token = await SharedPreferenceManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
'Authorization': 'Bearer $token',
    };

    var queryParams = {"name": ""};

    final response = await _dio.get(
      ApiConstant.categores,
      options: Options(headers: headers),
      queryParameters: queryParams,
    );

    return response.data;
  }

  Future<Map<String, dynamic>> getTopSearch() async {
    final token = await SharedPreferenceManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
'Authorization': 'Bearer $token',
    };

    var queryParams = {"name": ""};

    final response = await _dio.get(
      'https://marketi-app.onrender.com/api/v1/home/topSearch',
      options: Options(headers: headers),
      queryParameters: queryParams,
    );

    return response.data;
  }
}

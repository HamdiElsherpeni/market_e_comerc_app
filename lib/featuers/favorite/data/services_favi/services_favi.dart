import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/add_favi/add_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/delet_favi/delet_favi_response.dart';

import '../../../../core/utlis/api_constant.dart';
import '../../../../core/utlis/shared_preferences.dart';

class ServicesFavi {
  final Dio _dio = Dio();
  final SharedPreferenceManager sharedPreferenceManager =
      SharedPreferenceManager();
  Future<AddFaviResponse> addToCart({required String productId}) async {
    final token = await SharedPreferenceManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // هات التوكن من عندك
    };

    var data = json.encode({"productId": productId});

    var response = await _dio.request(
      ApiConstant.addFavorite, // ضيف المسار بتاع الـ API هنا
      options: Options(method: 'POST', headers: headers),
      data: data,
    );

    return AddFaviResponse.fromJson(response.data);
  }

  Future<DeletFaviResponse> deleteFromCart({required String productId}) async {
    final token = await SharedPreferenceManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var data = json.encode({"productId": productId});

    var response = await _dio.request(
      ApiConstant.deletFavorite, // ضيف مسار الـ delete هنا
      options: Options(method: 'DELETE', headers: headers),
      data: data,
    );

    return DeletFaviResponse.fromJson(response.data);
  }
}

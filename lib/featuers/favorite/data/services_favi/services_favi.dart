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
  Future<AddFaviResponse> addFvieProduct({required String productId}) async {
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

  Future<DeletFaviResponse> deletFvieProduct({required String productId}) async {
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

   Future<dynamic> getFavi() async {
    final token = await SharedPreferenceManager.getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await _dio.request(
      ApiConstant.getFavorite,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      // لو النص مستلم كسلسلة نصية -> حاول نفكه
      if (data is String) {
        try {
          return jsonDecode(data);
        } catch (e) {
          throw Exception('Failed to parse favorites response string');
        }
      }
      // عادة Dio يرجع Map أو List
      return data;
    } else {
      throw Exception(response.statusMessage ?? 'Failed to fetch favorites');
    }
  }
}

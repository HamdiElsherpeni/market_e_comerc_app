import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/utlis/api_constant.dart';
import '../../../../core/utlis/shared_preferences.dart';
import '../models/addprudut_cart_respons.dart';

class CartServices {
  final Dio _dio = Dio();
  final SharedPreferenceManager sharedPreferenceManager =
      SharedPreferenceManager();
  Future<AddToCartResponse> addToCart({required String productId}) async {
     final token = await SharedPreferenceManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // هات التوكن من عندك
    };

    var data = json.encode({"productId": productId});

    var response = await _dio.request(
      ApiConstant.addCart, // ضيف المسار بتاع الـ API هنا
      options: Options(method: 'POST', headers: headers),
      data: data,
    );

    return AddToCartResponse.fromJson(response.data);
  }
}

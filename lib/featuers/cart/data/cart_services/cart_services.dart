import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/delet_product_model/delet_respons.dart';

import '../../../../core/utlis/api_constant.dart';
import '../../../../core/utlis/shared_preferences.dart';
import '../models/add/addprudut_cart_respons.dart';
import '../models/get_cart/get_cart_response.dart';

class CartServices {
  final Dio _dio = Dio();
  final SharedPreferenceManager sharedPreferenceManager =
      SharedPreferenceManager();

  /// إضافة منتج للكارت
  Future<AddToCartResponse> addToCart({required String productId}) async {
    final token = await SharedPreferenceManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', 
    };

    var data = json.encode({"productId": productId});

    var response = await _dio.request(
      ApiConstant.addCart,
      options: Options(method: 'POST', headers: headers),
      data: data,
    );

    return AddToCartResponse.fromJson(response.data);
  }


  Future<DeletRespons> deleteFromCart({required String productId}) async {
    final token = await SharedPreferenceManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var data = json.encode({"productId": productId});

    var response = await _dio.request(
      ApiConstant.deletCart,
      options: Options(method: 'DELETE', headers: headers),
      data: data,
    );

    return DeletRespons.fromJson(response.data);
  }

  /// جلب الكارت (List من العناصر)
  Future<Map<String, dynamic>> getCart() async {
    final token = await SharedPreferenceManager.getToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await _dio.request(
      ApiConstant.getCarrt,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    // هنا بنحوّل الـ List من الـ API لليست من GetCartResponse
    return (response.data );}
       
}

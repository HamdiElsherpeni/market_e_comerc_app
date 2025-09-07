import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/utlis/api_constant.dart';
import 'package:market_e_comerc_app/featuers/protofoli/data/models/update_user_data/update_user_response.dart';
import '../../../../core/utlis/shared_preferences.dart';

class ProtofolioService {
  final Dio _dio = Dio();

  Future<UpdateUserResponse> editUserData({
    required String name,
    required String email,
    required String gender,
    required String type,
    required String address,
    required String phone,
  }) async {
    final token = await SharedPreferenceManager.getToken();

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final data = {
      "name": name,
      "email": email,
      "gender": gender,
      "image": "",
      "type": type,
      "address": address,
      "phone": phone,
    };

    final response = await _dio.post(
      ApiConstant.editUser,
      options: Options(headers: headers),
      data: data,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final respData = response.data;

      // لو الاستجابة String -> نفكها JSON
      if (respData is String) {
        final decoded = jsonDecode(respData);
        return UpdateUserResponse.fromJson(decoded);
      } else if (respData is Map<String, dynamic>) {
        return UpdateUserResponse.fromJson(respData);
      } else {
        throw Exception('Unexpected response format: ${respData.runtimeType}');
      }
    } else {
      throw Exception(response.statusMessage ?? 'Unknown error');
    }
  }
}

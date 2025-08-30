import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/utlis/api_constant.dart';

class AuthServices {
  final Dio _dio = Dio();
 

  /// 🔹 SignUp Method
  Future<dynamic> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var data = json.encode({
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      });

      var response = await _dio.post(
       ApiConstant.sinUp,
        options: Options(headers: headers),
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ SignUp Success: ${response.data}");
        return response.data;
      } else {
        print("⚠️ SignUp Failed: ${response.statusMessage}");
        return {"error": response.statusMessage};
      }
    } catch (e) {
      print("❌ Exception: $e");
      return {"error": e.toString()};
    }
  }
}

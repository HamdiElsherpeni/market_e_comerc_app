import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/utlis/api_constant.dart';
import 'package:market_e_comerc_app/core/utlis/shared_preferences.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/reset_password_by_email_model/reset_pass_request.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/sinin_model/sin_in_request.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/sinin_model/sin_in_response.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/sinup_models/sin_uo_response.dart';

import '../models/reset_password_by_email_model/reset_pass_response.dart';

class AuthServices {
  final Dio _dio = Dio();
  final SharedPreferenceManager sharedPreferenceManager =
      SharedPreferenceManager();

  /// 🔹 SignUp Method
  Future<SinUPResponse> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
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
      return SinUPResponse.fromJson(response.data);
    } else {
      print("⚠️ SignUp Failed: ${response.statusMessage}");
      return SinUPResponse(message: response.statusMessage);
    }
  }

  /// 🔹 SignIn Method
  Future<SignInResponse> signInUser(
    final String email,
    final String password,
  ) async {
    var headers = {'Content-Type': 'application/json'};

    var data = json.encode({"email": email, "password": password});

    var response = await _dio.post(
      ApiConstant.sinIn,
      options: Options(headers: headers),
      data: data,
    );

    print("✅ Login Success: ${response.data}");

    // تحويل البيانات لـ SignInResponse
    SignInResponse signInResponse = SignInResponse.fromJson(response.data);

    // حفظ البيانات في SharedPreferences
    await SharedPreferenceManager.saveName(signInResponse.name);
    await SharedPreferenceManager.saveToken(signInResponse.token);
    


    return signInResponse;
  }

  Future<ResetPassResponse> sendResetPasswordEmail(
     final String email,
  ) async {
    var data= json.encode({'email':email});
    var response = await _dio.post(
      ApiConstant.resetPassword,
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: data,
    );
    return ResetPassResponse.fromJson(response.data);
  }
}

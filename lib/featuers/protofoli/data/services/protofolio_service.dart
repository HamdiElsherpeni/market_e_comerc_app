import 'package:dio/dio.dart';

import '../../../../core/utlis/shared_preferences.dart';

class ProtofolioService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> editUserData({
  required String name,
  String email = "",
  String gender = "",
  String image = "",
  String type = "",
  String address = "",
  String phone = "",
}) async {
  final token = await SharedPreferenceManager.getToken();

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var data = {
    "name": name,
    "email": email,
    "gender": gender,
    "image": image,
    "type": type,
    "address": address,
    "phone": phone,
  };

  final response = await _dio.post(
    'https://marketi-app.onrender.com/api/v1/portfoilo/editUserData',
    options: Options(headers: headers),
    data: data,
  );

  return response.data;
}

}
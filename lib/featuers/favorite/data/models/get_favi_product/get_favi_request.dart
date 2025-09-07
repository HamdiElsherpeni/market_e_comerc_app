// lib/featuers/favorite/data/models/get_favi_product/get_favi_request.dart
class GetFaviRequest {
  final String token;

  GetFaviRequest({required this.token});

  Map<String, String> toHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}

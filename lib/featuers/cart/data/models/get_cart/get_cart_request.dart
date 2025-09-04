class GetCartRequest {
  final String token;

  GetCartRequest({required this.token});

  Map<String, String> toHeaders() {
    return {
      'Authorization': 'Bearer $token',
    };
  }
}

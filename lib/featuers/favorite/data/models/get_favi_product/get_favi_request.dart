class GetFaviRequest {
  final String token;

  GetFaviRequest({required this.token});

  Map<String, String> toHeaders() {
    return {
      'Authorization': 'Bearer $token',
    };
  }
}

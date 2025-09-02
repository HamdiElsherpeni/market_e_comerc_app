class ActiveResetModelResponse {
  final String email;
  final String code;

  ActiveResetModelResponse({
    required this.email,
    required this.code,
  });

  // من JSON → Object
  factory ActiveResetModelResponse.fromJson(Map<String, dynamic> json) {
    return ActiveResetModelResponse(
      email: json['email'] ?? '',
      code: json['code'] ?? '',
    );
  }

  // من Object → JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'code': code,
    };
  }
}

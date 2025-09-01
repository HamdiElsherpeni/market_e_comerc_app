class SignInResponse {
  final String name;
  final String token;

  SignInResponse({
    required this.name,
    required this.token,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      name: json["name"] ?? "",
      token: json["token"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "token": token,
    };
  }
}

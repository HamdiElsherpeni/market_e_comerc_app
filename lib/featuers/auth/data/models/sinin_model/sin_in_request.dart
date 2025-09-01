class SignInRequest {
  final String email;
  final String password;

  SignInRequest({
    required this.email,
    required this.password,
  });

  // لتحويل الكلاس لـ Map (عشان تبعته في API)
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  // لتحويل من JSON إلى Object (لو هتستعمله)
  factory SignInRequest.fromJson(Map<String, dynamic> json) {
    return SignInRequest(
      email: json["email"] ?? "",
      password: json["password"] ?? "",
    );
  }
}

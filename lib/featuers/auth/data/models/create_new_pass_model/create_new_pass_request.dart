class CreateNewPassRequest {
  final String email;
  final String password;
  final String confirmPassword;

  CreateNewPassRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };
  }

  factory CreateNewPassRequest.fromJson(Map<String, dynamic> json) {
    return CreateNewPassRequest(
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      confirmPassword: json["confirmPassword"] ?? "",
    );
  }
}

class SignUpRequest {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  // لتحويل من JSON إلى Object
  factory SignUpRequest.fromJson(Map<String, dynamic> json) {
    return SignUpRequest(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }
  // لتحويل من Object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };
  }
}

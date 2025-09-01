class ResetPassByEmailRequestModel {
  final String email;

  ResetPassByEmailRequestModel({required this.email});

  // لتحويل الداتا لـ Map عشان يتبعت للـ API
  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }

  // لو الـ API رجعت Response بنفس الشكل
  factory ResetPassByEmailRequestModel.fromJson(Map<String, dynamic> json) {
    return ResetPassByEmailRequestModel(
      email: json["email"] ?? "",
    );
  }
}

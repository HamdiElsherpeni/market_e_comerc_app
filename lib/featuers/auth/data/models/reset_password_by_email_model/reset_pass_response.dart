class ResetPassResponse {
  final String message;

  ResetPassResponse({required this.message});

  // Factory لاستقبال الـ response
  factory ResetPassResponse.fromJson(Map<String, dynamic> json) {
    return ResetPassResponse(
      message: json["message"] ?? "",
    );
  }

  // لو حابب ترجعه تاني كـ Map
  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }
}

class ResetPasswordMessageResponse {
  final String message;

  ResetPasswordMessageResponse({required this.message});

  // من JSON → Object
  factory ResetPasswordMessageResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordMessageResponse(
      message: json['message'] ?? '',
    );
  }

  // من Object → JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}

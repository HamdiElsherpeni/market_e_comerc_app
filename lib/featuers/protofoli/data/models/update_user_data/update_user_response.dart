// lib/featuers/user/data/models/update_user_response.dart
class UpdateUserResponse {
  final String message;

  UpdateUserResponse({required this.message});

  /// JSON → Object
  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      message: json['message'] ?? '',
    );
  }

  /// Object → JSON (ممكن تستخدمها لو عايز تخزن في local storage أو logging)
  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }
}

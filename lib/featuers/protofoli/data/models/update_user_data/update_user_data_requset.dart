// lib/featuers/user/data/models/update_user_request.dart
class UpdateUserRequest {
  final String name;
  final String email;
  final String gender;
  final String image;
  final String type;
  final String address;
  final String phone;

  UpdateUserRequest({
    required this.name,
    required this.email,
    required this.gender,
    required this.image,
    required this.type,
    required this.address,
    required this.phone,
  });

  /// تحويل من JSON → Dart Object
  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) {
    return UpdateUserRequest(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'] ?? '',
      type: json['type'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  /// تحويل من Dart Object → JSON (لاستخدامه مع Dio)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "gender": gender,
      "image": image,
      "type": type,
      "address": address,
      "phone": phone,
    };
  }
}

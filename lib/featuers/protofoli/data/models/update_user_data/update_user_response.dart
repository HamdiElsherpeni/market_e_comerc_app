// lib/featuers/protofoli/data/models/update_user_data/update_user_response.dart
class UpdateUserMessage {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String gender;
  final String address;
  final String type;
  final String image;

  UpdateUserMessage({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.gender,
    required this.address,
    required this.type,
    required this.image,
  });

  factory UpdateUserMessage.fromJson(Map<String, dynamic> json) {
    return UpdateUserMessage(
      id: json['_id']?.toString() ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      type: json['type'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'gender': gender,
      'address': address,
      'type': type,
      'image': image,
    };
  }
}

class UpdateUserResponse {
  final UpdateUserMessage message;

  UpdateUserResponse({required this.message});

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    final msg = json['message'];
    if (msg is Map<String, dynamic>) {
      return UpdateUserResponse(
        message: UpdateUserMessage.fromJson(msg),
      );
    } else {
      // fallback: message could be string or null => create empty message
      return UpdateUserResponse(
        message: UpdateUserMessage.fromJson({}),
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message.toJson(),
    };
  }
}

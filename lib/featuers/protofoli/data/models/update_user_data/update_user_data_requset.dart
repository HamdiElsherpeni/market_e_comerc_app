// lib/featuers/protofoli/data/models/update_user_data/update_user_request.dart
class UpdateUserRequest {
  String name;
  String email;
  String gender;
  String image;
  String type;
  String address;
  String phone;

  UpdateUserRequest({
    required this.name,
    required this.email,
    required this.gender,
    required this.image,
    required this.type,
    required this.address,
    required this.phone,
  });

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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'image': image,
      'type': type,
      'address': address,
      'phone': phone,
    };
  }
}

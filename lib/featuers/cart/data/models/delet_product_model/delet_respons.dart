class DeletRespons {
  final String message;

  DeletRespons({required this.message});

  factory DeletRespons.fromJson(Map<String, dynamic> json) {
    return DeletRespons(
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}

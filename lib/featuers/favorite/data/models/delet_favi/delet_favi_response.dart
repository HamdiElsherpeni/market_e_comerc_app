class DeletFaviResponse {
  final String message;

  DeletFaviResponse({required this.message});

  factory DeletFaviResponse.fromJson(Map<String, dynamic> json) {
    return DeletFaviResponse(
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}

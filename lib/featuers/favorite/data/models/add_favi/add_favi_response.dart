class AddFaviResponse {
  final String message;

  AddFaviResponse({required this.message});

  factory AddFaviResponse.fromJson(Map<String, dynamic> json) {
    return AddFaviResponse(
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}

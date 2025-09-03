class CreateNewPassResponse {
  final String message;

  CreateNewPassResponse({required this.message});

  factory CreateNewPassResponse.fromJson(Map<String, dynamic> json) {
    return CreateNewPassResponse(
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }
}

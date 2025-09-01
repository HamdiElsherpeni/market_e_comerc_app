class SinUPResponse {
  final String? message;

  const SinUPResponse({this.message});

  /// Create from a JSON Map
  factory SinUPResponse.fromJson(Map<String, dynamic> json) {
    return SinUPResponse(
      message: json['message'] as String?,
    );
  }

  /// Convert to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  /// Handy copyWith
  SinUPResponse copyWith({String? message}) {
    return SinUPResponse(
      message: message ?? this.message,
    );
  }

  @override
  String toString() => 'SinUPResponse(message: $message)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SinUPResponse && other.message == message;

  @override
  int get hashCode => message.hashCode;
}

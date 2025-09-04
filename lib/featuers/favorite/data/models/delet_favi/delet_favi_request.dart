class DeletFaviRequest {
  final String productId;

  DeletFaviRequest({required this.productId});

  factory DeletFaviRequest.fromJson(Map<String, dynamic> json) {
    return DeletFaviRequest(
      productId: json['productId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
    };
  }
}
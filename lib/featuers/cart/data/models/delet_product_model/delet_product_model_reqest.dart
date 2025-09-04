class DeleteFromCartRequest {
  final String productId;

  DeleteFromCartRequest({required this.productId});

  factory DeleteFromCartRequest.fromJson(Map<String, dynamic> json) {
    return DeleteFromCartRequest(
      productId: json['productId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
    };
  }
}

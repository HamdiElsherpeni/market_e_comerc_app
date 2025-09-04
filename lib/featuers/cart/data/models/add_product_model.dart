class AddProductModel {
  final String productId;

  AddProductModel({required this.productId});

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      productId: json['productId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
    };
  }
}

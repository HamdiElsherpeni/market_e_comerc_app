class AddFaviReuest {
  final String productId;

  AddFaviReuest({required this.productId});

  factory AddFaviReuest.fromJson(Map<String, dynamic> json) {
    return AddFaviReuest(
      productId: json['productId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
    };
  }
}
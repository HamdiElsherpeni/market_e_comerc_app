import 'package:equatable/equatable.dart';

import 'location_product.dart';

class PopulerModel extends Equatable {
	final Location? location;
	final String? id;
	final String? title;
	final int? price;
	final String? description;
	final List<dynamic>? images;
	final double? rating;
	final int? discount;
	final int? remain;
	final int? sold;
	final String? category;
	final String? brand;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final int? v;

	const PopulerModel({
		this.location, 
		this.id, 
		this.title, 
		this.price, 
		this.description, 
		this.images, 
		this.rating, 
		this.discount, 
		this.remain, 
		this.sold, 
		this.category, 
		this.brand, 
		this.createdAt, 
		this.updatedAt, 
		this.v, 
	});

	factory PopulerModel.fromJson(Map<String, dynamic> json) => PopulerModel(
				location: json['location'] == null
						? null
						: Location.fromJson(json['location'] as Map<String, dynamic>),
				id: json['_id'] as String?,
				title: json['title'] as String?,
				price: json['price'] as int?,
				description: json['description'] as String?,
				images: json['images'] as List<dynamic>?,
				rating: (json['rating'] as num?)?.toDouble(),
				discount: json['discount'] as int?,
				remain: json['remain'] as int?,
				sold: json['sold'] as int?,
				category: json['category'] as String?,
				brand: json['brand'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				v: json['__v'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'location': location?.toJson(),
				'_id': id,
				'title': title,
				'price': price,
				'description': description,
				'images': images,
				'rating': rating,
				'discount': discount,
				'remain': remain,
				'sold': sold,
				'category': category,
				'brand': brand,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'__v': v,
			};

	@override
	List<Object?> get props {
		return [
				location,
				id,
				title,
				price,
				description,
				images,
				rating,
				discount,
				remain,
				sold,
				category,
				brand,
				createdAt,
				updatedAt,
				v,
		];
	}
}

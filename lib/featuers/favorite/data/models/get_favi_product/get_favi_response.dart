class GetFaviResponse {
  final String id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final double rating;
  final int discount;
  final int remain;
  final int sold;
  final String category;
  final String brand;
  final LocationData location;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  GetFaviResponse({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.rating,
    required this.discount,
    required this.remain,
    required this.sold,
    required this.category,
    required this.brand,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory GetFaviResponse.fromJson(Map<String, dynamic> json) {
    return GetFaviResponse(
      id: json["_id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      images: List<String>.from(json["images"]),
      rating: (json["rating"] as num).toDouble(),
      discount: json["discount"],
      remain: json["remain"],
      sold: json["sold"],
      category: json["category"],
      brand: json["brand"],
      location: LocationData.fromJson(json["location"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "title": title,
      "price": price,
      "description": description,
      "images": images,
      "rating": rating,
      "discount": discount,
      "remain": remain,
      "sold": sold,
      "category": category,
      "brand": brand,
      "location": location.toJson(),
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
      "__v": v,
    };
  }
}

class LocationData {
  final Location location;
  final String name;

  LocationData({
    required this.location,
    required this.name,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      location: Location.fromJson(json["location"]),
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location.toJson(),
      "name": name,
    };
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json["type"],
      coordinates: List<double>.from(json["coordinates"].map((x) => (x as num).toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "coordinates": coordinates,
    };
  }
}

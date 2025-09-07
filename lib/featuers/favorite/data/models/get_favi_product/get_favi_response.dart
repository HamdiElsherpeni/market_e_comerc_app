// lib/featuers/favorite/data/models/get_favi_product/get_favi_response.dart
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
      id: json["_id"]?.toString() ?? '',
      title: json["title"]?.toString() ?? '',
      price: (json["price"] is num) ? (json["price"] as num).toInt() : int.tryParse(json["price"]?.toString() ?? '0') ?? 0,
      description: json["description"]?.toString() ?? '',
      images: (json["images"] is List) ? List<String>.from((json["images"] as List).map((x) => x?.toString() ?? '')) : [],
      rating: (json["rating"] is num) ? (json["rating"] as num).toDouble() : double.tryParse(json["rating"]?.toString() ?? '0') ?? 0.0,
      discount: (json["discount"] is num) ? (json["discount"] as num).toInt() : int.tryParse(json["discount"]?.toString() ?? '0') ?? 0,
      remain: (json["remain"] is num) ? (json["remain"] as num).toInt() : int.tryParse(json["remain"]?.toString() ?? '0') ?? 0,
      sold: (json["sold"] is num) ? (json["sold"] as num).toInt() : int.tryParse(json["sold"]?.toString() ?? '0') ?? 0,
      category: json["category"]?.toString() ?? '',
      brand: json["brand"]?.toString() ?? '',
      location: json["location"] is Map ? LocationData.fromJson(json["location"]) : LocationData(location: Location(type: '', coordinates: []), name: ''),
      createdAt: DateTime.tryParse(json["createdAt"]?.toString() ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: DateTime.tryParse(json["updatedAt"]?.toString() ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0),
      v: (json["__v"] is num) ? (json["__v"] as num).toInt() : int.tryParse(json["__v"]?.toString() ?? '0') ?? 0,
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
      location: json["location"] is Map ? Location.fromJson(json["location"]) : Location(type: '', coordinates: []),
      name: json["name"]?.toString() ?? '',
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
    final coords = <double>[];
    if (json["coordinates"] is List) {
      for (var x in json["coordinates"]) {
        if (x is num) {
          coords.add((x).toDouble());
        } else {
          final parsed = double.tryParse(x?.toString() ?? '');
          if (parsed != null) coords.add(parsed);
        }
      }
    }
    return Location(
      type: json["type"]?.toString() ?? '',
      coordinates: coords,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "coordinates": coordinates,
    };
  }
}

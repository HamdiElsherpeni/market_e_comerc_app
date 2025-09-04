import 'package:equatable/equatable.dart';

import 'location_product.dart';

class Location extends Equatable {
	final Location? location;
	final String? name;

	const Location({this.location, this.name});

	factory Location.fromJson(Map<String, dynamic> json) => Location(
				location: json['location'] == null
						? null
						: Location.fromJson(json['location'] as Map<String, dynamic>),
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'location': location?.toJson(),
				'name': name,
			};

	@override
	List<Object?> get props => [location, name];
}

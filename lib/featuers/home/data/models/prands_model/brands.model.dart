import 'package:equatable/equatable.dart';

class BrandsModel extends Equatable {
	final String? id;
	final String? name;
	final String? imagePath;
	final int? v;

	const BrandsModel({this.id, this.name, this.imagePath, this.v});

	factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
				id: json['_id'] as String?,
				name: json['name'] as String?,
				imagePath: json['imagePath'] as String?,
				v: json['__v'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'name': name,
				'imagePath': imagePath,
				'__v': v,
			};

	@override
	List<Object?> get props => [id, name, imagePath, v];
}

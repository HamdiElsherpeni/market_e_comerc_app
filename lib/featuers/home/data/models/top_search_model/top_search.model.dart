import 'package:equatable/equatable.dart';

class TopSearch extends Equatable {
	final String? id;
	final String? data;
	final int? number;
	final int? v;

	const TopSearch({this.id, this.data, this.number, this.v});

	factory TopSearch.fromJson(Map<String, dynamic> json) => TopSearch(
				id: json['_id'] as String?,
				data: json['data'] as String?,
				number: json['number'] as int?,
				v: json['__v'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'data': data,
				'number': number,
				'__v': v,
			};

	@override
	List<Object?> get props => [id, data, number, v];
}

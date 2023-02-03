import 'package:equatable/equatable.dart';

class Trailer extends Equatable {
  final int id;
  final List<Results> results;

  const Trailer({
    required this.id,
    required this.results,
  });

  @override
  List<Object?> get props => [
        id,
        results,
      ];
}

class Results extends Equatable {
  final String iso_639_1;
  final String iso_3166_1;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  const Results({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  @override
  List<Object?> get props => [
    iso_639_1,
    iso_3166_1,
    name,
    key,
    site,
    size,
    type,
    official,
    publishedAt,
    id,
  ];
}

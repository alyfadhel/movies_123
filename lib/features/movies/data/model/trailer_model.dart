
import 'package:movies123/features/movies/domain/entities/trailer.dart';

class TrailerModel extends Trailer {
  const TrailerModel({
    required super.id,
    required super.results,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      id: json['id'],
      results: List<ResultsModel>.from(
        (json['results']).map(
          (e) => ResultsModel.fromJson(e),
        ),
      ),
    );
  }
}

class ResultsModel extends Results {
  const ResultsModel({
    required super.iso_639_1,
    required super.iso_3166_1,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    required super.official,
    required super.publishedAt,
    required super.id,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
      iso_639_1: json['iso_639_1'],
      iso_3166_1: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }
}

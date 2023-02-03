
import 'package:movies123/features/movies/domain/entities/similar_movies.dart';

class SimilarMoviesModel extends SimilarMovies {
  const SimilarMoviesModel({
    required super.id,
    required super.originalTitle,
    required super.posterPath,
  });

  factory SimilarMoviesModel.fromJson(Map<String, dynamic> json) {
    return SimilarMoviesModel(
      id: json['id'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
    );
  }
}

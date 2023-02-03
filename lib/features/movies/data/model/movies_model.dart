

import 'package:movies123/features/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.voteAverage,
    required super.backdropPath,
    required super.genreIds,
    required super.posterPath,
    required super.overview,
    required super.releaseDate,

  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json['id'],
      title: json['title'],
      voteAverage: json['vote_average'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      posterPath: json['poster_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],

    );
  }
}

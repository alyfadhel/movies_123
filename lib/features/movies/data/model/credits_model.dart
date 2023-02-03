

import 'package:movies123/features/movies/domain/entities/credits.dart';

class CreditsModel extends Credits {
  const CreditsModel({
    required super.id,
    required super.cast,
  });

  factory CreditsModel.fromJson(Map<String, dynamic> json) {
    return CreditsModel(
      id: json['id'],
      cast: List<CastMoviesModel>.from(json['cast'].map((e) => CastMoviesModel.fromJson(e))),
    );
  }
}

class CastMoviesModel extends CastMovies {
  const CastMoviesModel({
    required super.adult,
    required super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    required super.profilePath,
    required super.castId,
    required super.character,
    required super.creditId,
    required super.order,
  });

  factory CastMoviesModel.fromJson(Map<String, dynamic> json) {
    return CastMoviesModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }
}

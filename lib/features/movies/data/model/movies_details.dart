

import 'package:movies123/features/movies/domain/entities/movies_details.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel({
    required super.id,
    required super.posterPath,
    required super.backdropPath,
    required super.genres,
    required super.originalTitle,
    required super.originalLanguage,
    required super.status,
    required super.releaseDate,
    required super.revenue,
    required super.tagline,
    required super.overview,
    required super.voteAverage,
    required super.productionCountries,
  });

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) {
    // List<GenresModel>genres = [];
    // if(json['genres'] != null){
    //   json['genres'].forEach((element){
    //     genres.add(element);
    //   });
    // }
    return MoviesDetailsModel(
      id: json['id'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      genres: List<GenresModel>.from(
          json['genres'].map((e) => GenresModel.fromJson(e))),
      originalTitle: json['original_title'],
      originalLanguage: json['original_language'],
      status: json['status'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      tagline: json['tagline'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      productionCountries: List<ProductionCountriesModel>.from(
          json['production_countries'].map((e) => ProductionCountriesModel.fromJson(e))),
    );
  }
}

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCountriesModel extends ProductionCountries {
  const ProductionCountriesModel({
    required super.iso_3166_1,
    required super.name,
  });

  factory ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountriesModel(
      iso_3166_1: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

import 'package:equatable/equatable.dart';

class MoviesDetails extends Equatable {
  final int id;
  final String posterPath;
  final String backdropPath;
  final List<Genres> genres;
  final String originalTitle;
  final String originalLanguage;
  final String status;
  final String releaseDate;
  final int revenue;
  final String tagline;
  final String overview;
  final dynamic voteAverage;
  final List<ProductionCountries> productionCountries;

  const MoviesDetails({
    required this.id,
    required this.posterPath,
    required this.backdropPath,
    required this.genres,
    required this.originalTitle,
    required this.originalLanguage,
    required this.status,
    required this.releaseDate,
    required this.revenue,
    required this.tagline,
    required this.overview,
    required this.voteAverage,
    required this.productionCountries,
  });

  @override
  List<Object?> get props => [
        id,
        posterPath,
        backdropPath,
        genres,
        originalTitle,
        originalLanguage,
        status,
        releaseDate,
        revenue,
        tagline,
        overview,
        voteAverage,
        productionCountries,
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class ProductionCountries extends Equatable {
  final String iso_3166_1;
  final String name;

  const ProductionCountries({
    required this.iso_3166_1,
    required this.name,
  });

  @override
  List<Object?> get props => [
        iso_3166_1,
        name,
      ];
}

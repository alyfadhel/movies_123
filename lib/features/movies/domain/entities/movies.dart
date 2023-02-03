import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final dynamic voteAverage;
  final String? backdropPath;
  final List<int> genreIds;
  final String posterPath;
  final String overview;
  final String releaseDate;


  const Movies({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.backdropPath,
    required this.genreIds,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,

  });

  @override
  List<Object?> get props => [
    id,
    title,
    voteAverage,
    backdropPath,
    genreIds,
    posterPath,
    overview,
    releaseDate,

  ];
}

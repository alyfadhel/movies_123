import 'package:equatable/equatable.dart';

class SimilarMovies extends Equatable {
  final int? id;
  final String? originalTitle;
  final String? posterPath;

  const SimilarMovies({
    required this.id,
    required this.originalTitle,
    required this.posterPath,
  });

  @override
  List<Object?> get props => [
    id,
    originalTitle,
    posterPath,
  ];
}

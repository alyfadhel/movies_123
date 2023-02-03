import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies123/core/error/failure.dart';
import 'package:movies123/features/movies/domain/entities/credits.dart';
import 'package:movies123/features/movies/domain/entities/movies.dart';
import 'package:movies123/features/movies/domain/entities/movies_details.dart';
import 'package:movies123/features/movies/domain/entities/similar_movies.dart';
import 'package:movies123/features/movies/domain/entities/trailer.dart';


abstract class BaseMoviesRepository
{
  Future<Either<Failure,List<Movies>>>getNowPlayingMovies();
  Future<Either<Failure,List<Movies>>>getPopularMovies(PageDetailsParameters parameters);
  Future<Either<Failure,List<Movies>>>getTopRatedMovies();
  Future<Either<Failure,List<Movies>>>getUpComingMovies();
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(MoviesDetailsParameters parameters);
  Future<Either<Failure,Credits>>getCastActors(MoviesDetailsParameters parameters);
  Future<Either<Failure,List<SimilarMovies>>>getSimilarMovies(MoviesDetailsParameters parameters);
  Future<Either<Failure,List<Results>>>getVideos(MoviesDetailsParameters parameters);
}

class MoviesDetailsParameters extends Equatable {
  final int id;

  const MoviesDetailsParameters({required this.id});

  @override
  List<Object?> get props => [
    id,
  ];
}

class PageDetailsParameters extends Equatable
{
  final int page;

  const PageDetailsParameters({required this.page});
  @override
  List<Object?> get props => [page];

}
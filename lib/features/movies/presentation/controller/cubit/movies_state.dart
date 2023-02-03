

import 'package:movies123/features/movies/domain/entities/credits.dart';
import 'package:movies123/features/movies/domain/entities/movies.dart';
import 'package:movies123/features/movies/domain/entities/movies_details.dart';
import 'package:movies123/features/movies/domain/entities/similar_movies.dart';
import 'package:movies123/features/movies/domain/entities/trailer.dart';

abstract class MoviesStates{}

class InitialMoviesState extends MoviesStates{}

class GetNowPlayingMoviesLoadingState extends MoviesStates{}
class GetNowPlayingMoviesSuccessState extends MoviesStates{
  final List<Movies> movies;

  GetNowPlayingMoviesSuccessState(this.movies);
}
class GetNowPlayingMoviesErrorState extends MoviesStates
{
  final String error;

  GetNowPlayingMoviesErrorState(this.error);
}

class GetPopularMoviesLoadingState extends MoviesStates{}
class GetPopularMoviesSuccessState extends MoviesStates{
  final List<Movies> movies;

  GetPopularMoviesSuccessState(this.movies);
}
class GetPopularMoviesErrorState extends MoviesStates
{
  final String error;

  GetPopularMoviesErrorState(this.error);
}

class GetTopRatedLoadingState extends MoviesStates{}
class GetTopRatedSuccessState extends MoviesStates{
  final List<Movies> movies;

  GetTopRatedSuccessState(this.movies);
}
class GetTopRatedErrorState extends MoviesStates
{
  final String error;

  GetTopRatedErrorState(this.error);
}

class GetUpComingLoadingState extends MoviesStates{}
class GetUpComingSuccessState extends MoviesStates{
  final List<Movies> movies;

  GetUpComingSuccessState(this.movies);
}
class GetUpComingErrorState extends MoviesStates
{
  final String error;

  GetUpComingErrorState(this.error);
}


class GetMoviesDetailsLoadingState extends MoviesStates{}
class GetMoviesDetailsSuccessState extends MoviesStates
{
  final MoviesDetails moviesDetails;

  GetMoviesDetailsSuccessState(this.moviesDetails);
}
class GetMoviesDetailsErrorState extends MoviesStates
{
  final String error;

  GetMoviesDetailsErrorState(this.error);
}

class GetCastActorLoadingState extends MoviesStates{}

class GetCastActorSuccessState extends MoviesStates
{
  final Credits credits;

  GetCastActorSuccessState(this.credits);
}

class GetCastActorErrorState extends MoviesStates
{
  final String error;

  GetCastActorErrorState(this.error);
}

class GetSimilarMoviesLoadingState extends MoviesStates{}
class GetSimilarMoviesSuccessState extends MoviesStates
{
  final List<SimilarMovies> similarMovies;

  GetSimilarMoviesSuccessState(this.similarMovies);
}
class GetSimilarMoviesErrorState extends MoviesStates
{
  final String error;

  GetSimilarMoviesErrorState(this.error);
}

class GetVideosSuccessState extends MoviesStates
{
  final List<Results> results;

  GetVideosSuccessState(this.results);
}
class GetVideosErrorState extends MoviesStates
{
  final String error;

  GetVideosErrorState(this.error);
}

class ToggleIsEndState extends MoviesStates{}
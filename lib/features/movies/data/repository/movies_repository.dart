import 'package:dartz/dartz.dart';
import 'package:movies123/core/error/exceptions.dart';
import 'package:movies123/core/error/failure.dart';
import 'package:movies123/features/movies/data/datasource/base_movies_remote_data_source.dart';
import 'package:movies123/features/movies/domain/entities/credits.dart';
import 'package:movies123/features/movies/domain/entities/movies.dart';
import 'package:movies123/features/movies/domain/entities/movies_details.dart';
import 'package:movies123/features/movies/domain/entities/similar_movies.dart';
import 'package:movies123/features/movies/domain/entities/trailer.dart';
import 'package:movies123/features/movies/domain/repository/base_movies_repository.dart';


class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(
        result,
      );
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies(PageDetailsParameters parameters) async{
    final result = await baseMoviesRemoteDataSource.getPopularMovies(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message),);
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async{
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getUpComingMovies() async{
    final result = await baseMoviesRemoteDataSource.getUpComingMovies();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(MoviesDetailsParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getMoviesDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, Credits>> getCastActors(MoviesDetailsParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getCastActor(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<SimilarMovies>>> getSimilarMovies(MoviesDetailsParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getSimilarMovies(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Results>>> getVideos(MoviesDetailsParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getVideos(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message),);
    }
  }
}

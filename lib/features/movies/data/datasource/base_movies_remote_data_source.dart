import 'package:movies123/core/network/dio_helper.dart';
import 'package:movies123/core/network/end-points.dart';
import 'package:movies123/features/movies/data/model/credits_model.dart';
import 'package:movies123/features/movies/data/model/movies_details.dart';
import 'package:movies123/features/movies/data/model/movies_model.dart';
import 'package:movies123/features/movies/data/model/similar_movies_model.dart';
import 'package:movies123/features/movies/data/model/trailer_model.dart';
import 'package:movies123/features/movies/domain/entities/trailer.dart';
import 'package:movies123/features/movies/domain/repository/base_movies_repository.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies(PageDetailsParameters parameters);

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<List<MoviesModel>> getUpComingMovies();

  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailsParameters parameters);

  Future<CreditsModel> getCastActor(MoviesDetailsParameters parameters);

  Future<List<SimilarMoviesModel>> getSimilarMovies(
      MoviesDetailsParameters parameters);

  Future<List<Results>> getVideos(MoviesDetailsParameters parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  final DioHelper dioHelper;

  MoviesRemoteDataSource(this.dioHelper);

  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await dioHelper.get(
      endPoint: path('now_playing'),
    );
    return List<MoviesModel>.from(
      (response['results'] as List).map(
        (e) => MoviesModel.fromJson(e),
      ),
    );
  }

  @override
  Future<List<MoviesModel>> getPopularMovies(
      PageDetailsParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: popularEndPoint(
        'popular',
        parameters.page,
      ),
    );

    return List<MoviesModel>.from(
        (response['results'] as List).map((e) => MoviesModel.fromJson(e)));
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await dioHelper.get(
      endPoint: path(
        'top_rated',
      ),
    );
    return List<MoviesModel>.from(
        (response['results'] as List).map((e) => MoviesModel.fromJson(e)));
  }

  @override
  Future<List<MoviesModel>> getUpComingMovies() async {
    final response = await dioHelper.get(
      endPoint: path(
        'upcoming',
      ),
    );
    return List<MoviesModel>.from(
        (response['results'] as List).map((e) => MoviesModel.fromJson(e)));
  }

  @override
  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailsParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: movieDetailsPath(
        parameters.id,
      ),
    );
    return MoviesDetailsModel.fromJson(response);
  }

  @override
  Future<CreditsModel> getCastActor(MoviesDetailsParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: creditsPath(
        parameters.id,
      ),
    );
    return CreditsModel.fromJson(response);
  }

  @override
  Future<List<SimilarMoviesModel>> getSimilarMovies(
      MoviesDetailsParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: similarPath(parameters.id),
    );

    return List<SimilarMoviesModel>.from((response['results'] as List)
        .map((e) => SimilarMoviesModel.fromJson(e)));
  }

  @override
  Future<List<ResultsModel>> getVideos(
      MoviesDetailsParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: videosPath(parameters.id),
    );

    return List<ResultsModel>.from(
        (response['results'] as List).map((e) => ResultsModel.fromJson(e)));
  }
}

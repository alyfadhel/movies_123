import 'package:get_it/get_it.dart';
import 'package:movies123/core/network/dio_helper.dart';
import 'package:movies123/features/movies/data/datasource/base_movies_remote_data_source.dart';
import 'package:movies123/features/movies/data/repository/movies_repository.dart';
import 'package:movies123/features/movies/domain/repository/base_movies_repository.dart';
import 'package:movies123/features/movies/domain/usecase/get_cast_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_movies_details_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_now_playing_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_popular_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_similar_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_top_rated_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_up_coming_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_videos_use_case.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_cubit.dart';



final sl = GetIt.instance;

class ServiceLocator
{
  Future<void> init()async
  {
    sl.registerFactory(() => MoviesCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerLazySingleton(() => GetVideosUseCase(sl()));
    sl.registerLazySingleton(() => GetSimilarMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetCastUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetUpComingMoviesUseCase(sl()));
    sl.registerLazySingleton(
            () => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(
            () => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(
            () => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<BaseMoviesRepository>(
            () => MoviesRepository(sl()));
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
            () => MoviesRemoteDataSource(sl()));
    sl.registerLazySingleton<DioHelper>(
            () => DioHelperImpl());
  }
}
import 'package:dartz/dartz.dart';
import 'package:movies123/core/error/failure.dart';
import 'package:movies123/core/usecase/base_use_case.dart';
import 'package:movies123/features/movies/domain/entities/movies.dart';
import 'package:movies123/features/movies/domain/repository/base_movies_repository.dart';


class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters)async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }

}
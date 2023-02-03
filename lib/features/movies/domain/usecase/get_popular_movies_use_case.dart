import 'package:dartz/dartz.dart';
import 'package:movies123/core/error/failure.dart';
import 'package:movies123/core/usecase/base_use_case.dart';
import 'package:movies123/features/movies/domain/entities/movies.dart';
import 'package:movies123/features/movies/domain/repository/base_movies_repository.dart';


class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>,PageDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movies>>> call(PageDetailsParameters parameters)async {
    return await baseMoviesRepository.getPopularMovies(parameters);
  }

}
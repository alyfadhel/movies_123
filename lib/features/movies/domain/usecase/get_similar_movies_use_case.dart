import 'package:dartz/dartz.dart';
import 'package:movies123/core/error/failure.dart';
import 'package:movies123/core/usecase/base_use_case.dart';
import 'package:movies123/features/movies/domain/entities/similar_movies.dart';
import 'package:movies123/features/movies/domain/repository/base_movies_repository.dart';


class GetSimilarMoviesUseCase extends BaseUseCase<List<SimilarMovies>,MoviesDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetSimilarMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<SimilarMovies>>> call(MoviesDetailsParameters parameters)async {
    return await baseMoviesRepository.getSimilarMovies(parameters);
  }

}
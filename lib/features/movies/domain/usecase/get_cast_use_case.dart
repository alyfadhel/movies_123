import 'package:dartz/dartz.dart';
import 'package:movies123/core/error/failure.dart';
import 'package:movies123/core/usecase/base_use_case.dart';
import 'package:movies123/features/movies/domain/entities/credits.dart';
import 'package:movies123/features/movies/domain/repository/base_movies_repository.dart';


class GetCastUseCase extends BaseUseCase<Credits,MoviesDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetCastUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, Credits>> call(MoviesDetailsParameters parameters)async {
    return await baseMoviesRepository.getCastActors(parameters);
  }

}
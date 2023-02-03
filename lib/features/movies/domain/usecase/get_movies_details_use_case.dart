import 'package:dartz/dartz.dart';
import 'package:movies123/core/error/failure.dart';
import 'package:movies123/core/usecase/base_use_case.dart';
import 'package:movies123/features/movies/domain/entities/movies_details.dart';

import '../repository/base_movies_repository.dart';


class GetMoviesDetailsUseCase extends BaseUseCase<MoviesDetails,MoviesDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesDetails>> call(MoviesDetailsParameters parameters)async {
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }

}
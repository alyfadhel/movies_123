import 'package:dartz/dartz.dart';
import 'package:movies123/core/error/failure.dart';
import 'package:movies123/core/usecase/base_use_case.dart';
import 'package:movies123/features/movies/domain/entities/trailer.dart';
import 'package:movies123/features/movies/domain/repository/base_movies_repository.dart';


class GetVideosUseCase extends BaseUseCase<List<Results>,MoviesDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetVideosUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Results>>> call(MoviesDetailsParameters parameters)async {
    return await baseMoviesRepository.getVideos(parameters);
  }

}
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies123/core/usecase/base_use_case.dart';
import 'package:movies123/features/movies/domain/entities/credits.dart';
import 'package:movies123/features/movies/domain/entities/movies.dart';
import 'package:movies123/features/movies/domain/entities/movies_details.dart';
import 'package:movies123/features/movies/domain/entities/similar_movies.dart';
import 'package:movies123/features/movies/domain/entities/trailer.dart';
import 'package:movies123/features/movies/domain/repository/base_movies_repository.dart';
import 'package:movies123/features/movies/domain/usecase/get_cast_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_movies_details_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_now_playing_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_popular_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_similar_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_top_rated_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_up_coming_movies_use_case.dart';
import 'package:movies123/features/movies/domain/usecase/get_videos_use_case.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_state.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  List<Movies> movies = [];
  Credits? credits;
  MoviesDetails? moviesDetails;
  List<SimilarMovies> similarMovies = [];
  List<Results> results = [];
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetUpComingMoviesUseCase getUpComingMoviesUseCase;
  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetCastUseCase getCastUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  final GetVideosUseCase getVideosUseCase;

  MoviesCubit(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
    this.getUpComingMoviesUseCase,
    this.getMoviesDetailsUseCase,
    this.getCastUseCase,
    this.getSimilarMoviesUseCase,
    this.getVideosUseCase,
  ) : super(InitialMoviesState());

  static MoviesCubit get(context) => BlocProvider.of(context);

  void getNowPlayingMovies() async {
    emit(GetNowPlayingMoviesLoadingState());
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(GetNowPlayingMoviesErrorState(l.message)),
      (r) {
        movies = r;
        emit(GetNowPlayingMoviesSuccessState(r));
      },
    );
  }

  int page = 1;
  ScrollController scrollController = ScrollController();
  bool isLoadMore = false;


  Future<void> getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());

    final result = await getPopularMoviesUseCase(
      PageDetailsParameters(
        page: page,
      ),
    );
    result.fold(
      (l) => emit(
        GetPopularMoviesErrorState(l.message),
      ),
      (r) {
        movies = r;
        scrollController.addListener(() {
          loadingMore();
        });
        emit(
          GetPopularMoviesSuccessState(r),
        );
      },
    );
  }

  Future<void>loadingMore()async
  {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      isLoadMore = true;
      page++;
      final result = await getPopularMoviesUseCase(
        PageDetailsParameters(
          page: page,
        ),
      );
      result.fold(
            (l) => emit(
          GetPopularMoviesErrorState(l.message),
        ),
            (r) {
          movies.addAll(r);
          emit(
            GetPopularMoviesSuccessState(r),
          );
        },
      );
    }
  }


  void getTopRatedMovies() async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(GetTopRatedErrorState(l.message)),
      (r) {
        movies = r;
        emit(GetTopRatedSuccessState(r));
      },
    );
  }

  void getUpComingMovies() async {
    final result = await getUpComingMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(GetUpComingErrorState(l.message)),
      (r) {
        movies = r;
        emit(GetUpComingSuccessState(r));
      },
    );
  }

  void getMoviesDetails(int id) async {
    emit(GetMoviesDetailsLoadingState());
    final result = await getMoviesDetailsUseCase(
      MoviesDetailsParameters(id: id),
    );

    result.fold((l) => emit(GetMoviesDetailsErrorState(l.message)), (r) {
      moviesDetails = r;
      emit(GetMoviesDetailsSuccessState(r));
    });
  }

  void getCastActor(int id) async {
    emit(GetCastActorLoadingState());
    final result = await getCastUseCase(
      MoviesDetailsParameters(id: id),
    );

    debugPrint('Credits: $result');
    result.fold((l) => emit(GetCastActorErrorState(l.message)), (r) {
      credits = r;
      emit(GetCastActorSuccessState(r));
    });
  }

  void getSimilarMovies(int id) async {
    emit(GetSimilarMoviesLoadingState());

    final result =
        await getSimilarMoviesUseCase(MoviesDetailsParameters(id: id));

    debugPrint('Similar: $result');

    result.fold((l) => emit(GetSimilarMoviesErrorState(l.message)), (r) {
      similarMovies = r;
      emit(GetSimilarMoviesSuccessState(r));
    });
  }

  void getVideos(int id) async {
    final result = await getVideosUseCase(
      MoviesDetailsParameters(id: id),
    );

    debugPrint('VideosResults${results.toString()}');

    result.fold(
        (l) => emit(
              GetVideosErrorState(l.message),
            ), (r) {
      results = r;
      emit(
        GetVideosSuccessState(r),
      );
    });
  }
}

//https://youtu.be/XmpK_5EOuGc

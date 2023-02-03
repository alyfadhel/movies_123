import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies123/core/services/service_locator.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_state.dart';
import 'package:movies123/features/movies/presentation/widgets/see_all_details_popular.dart';



class SeeAllPopular extends StatelessWidget {
  const SeeAllPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesCubit>()..getPopularMovies(),
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MoviesCubit.get(context);
          if(state is GetPopularMoviesLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(state is GetPopularMoviesSuccessState){
            var movies = cubit.movies;
            return Scaffold(
              backgroundColor: Colors.black,
              body: GridView.count(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                controller: cubit.scrollController,
                childAspectRatio: 2 / 4.6,
                crossAxisCount: 2,
                children: List.generate(
                  cubit.isLoadMore
                      ? cubit.movies.length + 2
                      : cubit.movies.length,
                      (index) {
                    if (index >= cubit.movies.length) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return SeeAllDetailsForPopular(
                        movies: cubit.movies[index],
                      );
                    }
                  },
                ),
              ),
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies123/core/services/service_locator.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_state.dart';
import 'package:movies123/features/movies/presentation/widgets/build_show_details_popularItem.dart';

class ShowDetailsPopular extends StatelessWidget {
  final int id;

  const ShowDetailsPopular({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesCubit>()
        ..getMoviesDetails(id)
        ..getCastActor(id)
        ..getSimilarMovies(id)
        ..getVideos(id)
        ..getVideos(id),
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MoviesCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ConditionalBuilder(
                        condition: cubit.moviesDetails != null &&
                            cubit.credits != null,
                        builder: (context) => BuildShowDetailsPopularItem(
                          model: cubit.moviesDetails!,
                          credits: cubit.credits!,
                          similarMovies: cubit.similarMovies,
                          results: cubit.results,
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

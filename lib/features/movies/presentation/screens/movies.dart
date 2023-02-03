import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_state.dart';
import 'package:movies123/features/movies/presentation/widgets/build_now_playing_movies.dart';
import 'package:movies123/features/movies/presentation/widgets/build_popular_movies.dart';
import 'package:movies123/features/movies/presentation/widgets/build_top_rated_movies.dart';
import 'package:movies123/features/movies/presentation/widgets/build_up_coming_movies.dart';
import 'see_all_popular.dart';


class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MoviesCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 350.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      const BuildNowPlayingMovies(),
                  itemCount: cubit.movies.length,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Popular',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SeeAllPopular(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'See All',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300.0,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BuildPopularMovies(
                    movies: cubit.movies[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 8.0,
                  ),
                  itemCount: cubit.movies.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Top Rated',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'See All',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300.0,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BuildTopRatedMovies(
                    movies: cubit.movies[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 8.0,
                  ),
                  itemCount: cubit.movies.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Upcoming',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'See All',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300.0,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BuildUpComingMovies(
                    movies: cubit.movies[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 8.0,
                  ),
                  itemCount: cubit.movies.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

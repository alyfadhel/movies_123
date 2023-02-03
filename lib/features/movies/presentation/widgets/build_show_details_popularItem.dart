import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies123/core/network/end-points.dart';
import 'package:movies123/features/movies/domain/entities/credits.dart';
import 'package:movies123/features/movies/domain/entities/movies_details.dart';
import 'package:movies123/features/movies/domain/entities/similar_movies.dart';
import 'package:movies123/features/movies/domain/entities/trailer.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:movies123/features/movies/presentation/widgets/production_countries.dart';
import 'package:movies123/features/movies/presentation/widgets/production_of_kind_movies.dart';
import 'package:movies123/features/movies/presentation/widgets/web_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class BuildShowDetailsPopularItem extends StatelessWidget {
  final MoviesDetails model;
  final Credits credits;
  final List<SimilarMovies> similarMovies;
  final List<Results>results;

  const BuildShowDetailsPopularItem({
    Key? key,
    required this.model,
    required this.credits,
    required this.similarMovies,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.originalTitle.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: 253,
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                  ),
                  child: CachedNetworkImage(
                    height: 250.0,
                    width: 180.0,
                    fit: BoxFit.cover,
                    imageUrl: imageUrl(
                      model.posterPath,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 250.0,
                    child: Wrap(
                      children: [
                        Text(
                          '${model.releaseDate}, ',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(
                          height: 20.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                ProductionCountriesDetails(
                                    productionCountries:
                                        model.productionCountries[index]),
                            itemCount: model.productionCountries.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        ListView.builder(
                          itemBuilder: (context, index) =>
                              ProductionOfKindMovies(
                            genres: model.genres[index],
                          ),
                          itemCount: model.genres.length,
                          shrinkWrap: true,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            top: 20.0,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.green,
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.black,
                                    ),
                                    Text(
                                      model.voteAverage.round().toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 3,
                                  ),
                                ),
                                child: Text(
                                  model.originalLanguage.toUpperCase(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                              ),
                              Text(
                                model.status.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.green,
                                      fontSize: 12.0,
                                    ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Revenue',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                    ),
                              ),
                              Text(
                                model.revenue.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.green,
                                      fontSize: 12.0,
                                    ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Original Title',
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.grey,
              ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          model.originalTitle.toString(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          'Overview',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          model.tagline.toString(),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.grey,
              ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.overview.toString(),
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 14,
              ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Divider(
          height: 1,
          thickness: 2.0,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Trailer',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 155.0,
          child: ListView.separated(
            itemBuilder: (context, index) => buildTrailerItems(context, results[index]),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
            itemCount: results.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Divider(
          height: 1,
          thickness: 2.0,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Top Billed Cast',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 300.0,
          child: ListView.separated(
            itemBuilder: (context, index) =>
                buildCastActor(context, credits.cast[index]),
            itemCount: credits.cast.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
            //shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const Divider(
          height: 1,
          thickness: 2.0,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Similar Movies',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 300.0,
          child: ListView.separated(
            itemBuilder: (context, index) =>
                buildSimilarMovies(context, similarMovies[index]),
            itemCount: similarMovies.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
            //shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

Widget buildCastActor(context, CastMovies movies) => Column(
      children: [
        Container(
          width: 152.0,
          height: 202.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
          ),
          padding: const EdgeInsets.all(2.0),
          child: movies.profilePath != null
              ? CachedNetworkImage(
                  width: 150.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  imageUrl: imageUrl(movies.profilePath!.toString()),
                )
              : Image.asset('assets/images/person.png'),
        ),
        Text(
          movies.originalName.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          width: 150.0,
          child: Text(
            movies.character,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
        ),
      ],
    );

Widget buildTrailerItems(context,Results results)=>Column(
  children: [
    InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(results.key),
          ),
        );
      },
      child: Container(
        width: 205.0,
        height: 155.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(),
            shape: BoxShape.rectangle),
        child: Container(
          width: 100.0,
          height: 100.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
              border: Border.all(),
              shape: BoxShape.rectangle,
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl(
            MoviesCubit.get(context).moviesDetails!.posterPath
          ),),
        ),
      ),
    ),
  ],
);

Widget buildSimilarMovies(context, SimilarMovies similarMovies) => Column(
      children: [
        Container(
          width: 152.0,
          height: 202.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
          ),
          padding: const EdgeInsets.all(2.0),
          child: CachedNetworkImage(
            width: 150.0,
            height: 200.0,
            fit: BoxFit.cover,
            imageUrl: imageUrl(
              imageUrl(
                similarMovies.posterPath!.toString(),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: 140.0,
          child: Text(
            similarMovies.originalTitle!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
        ),
      ],
    );

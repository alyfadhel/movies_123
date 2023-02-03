import 'package:flutter/material.dart';
import 'package:movies123/core/network/end-points.dart';
import 'package:movies123/features/movies/domain/entities/movies.dart';
import 'package:movies123/features/movies/presentation/screens/show_details_popular.dart';


class SeeAllDetailsForPopular extends StatelessWidget {
  final Movies movies;

  const SeeAllDetailsForPopular({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowDetailsPopular(id: movies.id),
            ),
          );
        },
        child: Column(
          children: [
            Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imageUrl(
                      movies.posterPath,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              movies.overview,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies123/core/network/end-points.dart';
import 'package:movies123/features/movies/domain/entities/movies.dart';



class BuildUpComingMovies extends StatelessWidget {
  final Movies movies;

  const BuildUpComingMovies({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200.0,
          height: 250.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
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
      ],
    );
  }
}

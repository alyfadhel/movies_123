import 'package:flutter/material.dart';
import 'package:movies123/features/movies/domain/entities/movies_details.dart';


class ProductionOfKindMovies extends StatelessWidget {
  final Genres genres;
  const ProductionOfKindMovies({Key? key,required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${genres.name}, ',
          style: Theme.of(context).textTheme.caption!.copyWith(
            fontSize: 12.0,
          ),
        )
      ],
    );
  }
}

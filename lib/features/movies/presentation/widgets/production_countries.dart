import 'package:flutter/material.dart';
import 'package:movies123/features/movies/domain/entities/movies_details.dart';

class ProductionCountriesDetails extends StatelessWidget {
  final ProductionCountries productionCountries;
  const ProductionCountriesDetails({Key? key,required this.productionCountries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${productionCountries.iso_3166_1}, ',
      style: Theme.of(context).textTheme.caption,
    );
  }
}

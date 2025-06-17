import 'package:flutter/material.dart';
import 'package:sntegpito/Features/favourite/presentation/views/widgets/details_fav_view_body.dart';

class DetailsFavView extends StatelessWidget {
  const DetailsFavView(
      {super.key,
      required this.image,
      required this.Type,
      required this.nameCity,
      required this.name,
      required this.price,
      required this.description,
      required this.moreDescription});
  final String image;
  final String Type;
  final String nameCity;
  final String name;
  final String price;
  final String description;
  final String moreDescription;
  @override
  Widget build(BuildContext context) {
    return DetailsFavViewBody(
      imageUrl: image,
      Type: Type,
      nameCity: nameCity,
      name: name,
      price: price,
      description: description,
      moreDescription: moreDescription,
    );
  }
}

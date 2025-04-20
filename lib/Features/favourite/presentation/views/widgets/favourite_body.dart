import 'package:flutter/material.dart';
import 'package:sntegpito/Features/favourite/presentation/views/widgets/feature_custom_feedtime.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Favourite",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) {
              return const FeatureCustomFeedtime();
            },
          ))
        ],
      ),
    );
  }
}

class InitalWidgets extends StatelessWidget {
  const InitalWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images_home/favourite.jpg",
          width: 350,
          height: 350,
        ),
        const SizedBox(height: 10),
        const Text(
          "You don't have any",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // توسيط النص داخل Text widget
        ),
        const SizedBox(height: 10),
        const Text(
          "Favourites",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // توسيط النص داخل Text widget
        ),
        const SizedBox(height: 10),
        const Text(
          "Save what you like for later",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center, // توسيط النص داخل Text widget
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/favourite/presentation/manager/getfavouritecubit/getfav_cubit.dart';
import 'package:sntegpito/Features/favourite/presentation/views/widgets/feature_custom_feedtime.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

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
      body: BlocBuilder<GetfavCubit, GetfavState>(
        builder: (context, state) {
          if (state is GetfavLoading) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ));
          } else if (state is GetfavFauiler) {
            InitalWidgets(
              text: state.errmessage.toString(),
            );
          } else if (state is GetfavSucess) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: state.get_fav_model.data!.length,
                      (context, index) {
                    String price = state.get_fav_model.data![index].itemDetails
                            ?.pricePerNight
                            ?.toString() ??
                        state.get_fav_model.data![index].itemDetails?.price
                            ?.toString() ??
                        "0";
                    String headName =
                        state.get_fav_model.data![index].itemDetails?.name ??
                            "No name";

                    String add = state.get_fav_model.data![index].itemDetails
                            ?.description ??
                        "NO descrotion";

                    String image =
                        "${EndPoint.baseImageUrl}${state.get_fav_model.data![index].itemDetails?.image?.toString()}" ??
                            "No image";

                    return FeatureCustomFeedtime(
                      price: price,
                      headName: headName,
                      add: add,
                      image: image,
                    );
                  }),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class InitalWidgets extends StatelessWidget {
  const InitalWidgets({
    super.key,
    required this.text,
  });
  final String text;
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
        Text(
          text,
          style: const TextStyle(
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

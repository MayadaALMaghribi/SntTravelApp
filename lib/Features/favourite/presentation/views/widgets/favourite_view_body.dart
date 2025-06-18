import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sntegpito/Features/favourite/presentation/manager/getfavouritecubit/getfav_cubit.dart';
import 'package:sntegpito/Features/favourite/presentation/views/details_fav_view.dart';
import 'package:sntegpito/Features/favourite/presentation/views/widgets/details_torism.dart';
import 'package:sntegpito/Features/favourite/presentation/views/widgets/feature_custom_feedtime.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

import '../../../../../core/utils/constant.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
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
            // لازم ترجع الويجت هنا
            return InitalWidgets(
              text: state.errmessage.toString(),
            );
          } else if (state is GetfavSucess) {
            if (state.get_fav_model.data == null ||
                state.get_fav_model.data!.isEmpty) {
              return const Center(
                  child: InitalWidgets(text: "Favourite is empty"));
            }
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
                        "";
                    String headName =
                        state.get_fav_model.data![index].itemDetails?.name ??
                            "No name";

                    String add = state.get_fav_model.data![index].itemDetails
                            ?.description ??
                        "";
                    String getFormattedTime(String rawDate) {
                      DateTime parsedDate =
                          DateTime.parse(rawDate.split('.').first);
                      return DateFormat('h:mm a')
                          .format(parsedDate); // النتيجة: 8:51 AM
                    }

                    String image =
                        "${state.get_fav_model.data![index].itemDetails?.image?.toString()}" ??
                            "No image";
                    String itemtype =
                        state.get_fav_model.data![index].itemType ?? "null";
                    int iditemfav =
                        state.get_fav_model.data![index].itemId ?? 0;
                    CacheHelper().saveData(
                        key: Constants.idfav,
                        value: state.get_fav_model.data![index].isFavorite ??
                            false);
                    return FeatureCustomFeedtime(
                      price: price,
                      headName: headName,
                      add: add,
                      image: image,
                      typefav: itemtype,
                      itemfav: iditemfav,
                      time: getFormattedTime(
                          state.get_fav_model.data![index].addedAt!),
                      onTap: () {
                        if (state.get_fav_model.data![index].itemType ==
                            "Activity") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsFavView(
                                image: image,
                                Type:
                                    state.get_fav_model.data![index].itemType!,
                                nameCity: "",
                                name: headName,
                                price: price,
                                description: add,
                                moreDescription: state.get_fav_model
                                    .data![index].itemDetails!.moreDescription!,
                              ),
                            ),
                          );
                        } else if (state.get_fav_model.data![index].itemType ==
                            "TourismType") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TourismTypeDetails(
                                imageUrl: image,
                                Type:
                                    state.get_fav_model.data![index].itemType!,
                                nameCity: "",
                                name: headName,
                                price: '',
                                description: add,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  }),
                )
              ],
            );
          }
          return const InitalWidgets(text: "Favourite is empty");
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
    return Center(
      child: Column(
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
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "Favourites",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "Save what you like for later",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

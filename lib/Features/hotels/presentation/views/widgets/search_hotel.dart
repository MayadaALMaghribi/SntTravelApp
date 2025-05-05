import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

import '../../manager/search_hotel_by_name_cubit/search_hotel_by_name_cubit.dart';

class SearchHotel extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // context.read<SearchHotelByNameCubit>().searchHotels(query);
    context.read<SearchHotelByNameCubit>().fetchHotelsByName(cityName: query);
    CacheHelper().saveData(key: Constants.cityName, value: query);
    Future.microtask(() => close(context, query));

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text("Search for a city or hotel..."));
    }

    context.read<SearchHotelByNameCubit>().fetchHotelsByName(cityName: query);

    return BlocBuilder<SearchHotelByNameCubit, SearchHotelByNameState>(
      builder: (context, state) {
        if (state is SearchHotelByNameLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchHotelByNameFailure) {
          return Center(child: Text(state.errmessage));
        } else if (state is SearchHotelByNameSucess) {
          final hotels = state.searchHotelByNameModel;

          if (hotels.isEmpty) {
            return const Center(child: Text("No suggestions found."));
          }

          final seenTexts = <String>{}; // لتجنب التكرار
          final filtered = <String>[]; // اللي هنعرضه

          for (var hotel in hotels) {
            final input = query.toLowerCase();

            final name = hotel.name?.toLowerCase();
            final location = hotel.locationName?.toLowerCase();

            if (name != null && name.contains(input)) {
              if (!seenTexts.contains(hotel.name)) {
                seenTexts.add(hotel.name!);
                filtered.add(hotel.name!);
              }
            }

            if (location != null && location.contains(input)) {
              if (!seenTexts.contains(hotel.locationName)) {
                seenTexts.add(hotel.locationName!);
                filtered.add(hotel.locationName!);
              }
            }
          }

          return ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final displayText = filtered[index];

              return ListTile(
                title: Text(displayText),
                onTap: () async {
                  query = displayText;

                  await CacheHelper()
                      .saveData(key: Constants.cityName, value: query);
                  showResults(context);
                },
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

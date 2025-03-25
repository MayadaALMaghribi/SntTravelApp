import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Future.microtask(() => close(context, query));
    Future.microtask(
        () => CacheHelper().saveData(key: "cityName", value: query));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("Search for a city..."));
  }
}
/**
 *    ontap: () {
            showSearch(context: context, delegate: HomeHotelViewBody());
          },
 */
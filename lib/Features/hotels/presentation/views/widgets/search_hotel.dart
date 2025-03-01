import 'package:flutter/material.dart';

class SearchHotel extends SearchDelegate {
  final List<String> items = [
    'Cairo',
    'Giza',
    'Alexandria',
    'Luxor',
    'Aswan',
    'Sharm El-Sheikh',
    'Hurghada',
    'Siwa',
    'Fayoum',
    'Dahab',
    ''
  ]; // بيانات محلية

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> filteredItems = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredItems[index]),
          onTap: () {
            query = filteredItems[index];

            showResults(context);
          },
        );
      },
    );
  }
}
/**
 *    ontap: () {
            showSearch(context: context, delegate: HomeHotelViewBody());
          },
 */

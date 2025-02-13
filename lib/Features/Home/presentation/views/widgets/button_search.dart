import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //button clear
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
  Widget? buildLeading(BuildContext context) {
    //button back
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // النتائج بناءً على الـ query
    return Center(
      child: Text('result of search $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'laxour',
      'cairo',
      'pyramids',
      'sharm',
    ]
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}

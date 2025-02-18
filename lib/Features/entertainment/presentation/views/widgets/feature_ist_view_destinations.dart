import 'package:flutter/material.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/feature_card_destinations.dart';
import '../../../../Destionations/presentation/views/feature_activity_view.dart';

class ListViewDestinations extends StatelessWidget {
  const ListViewDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FeatureActivityView()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 8, right: 10, bottom: 2),
              child: FeatureCardDestinations(),
            ),
          );
        },
      ),
    );
  }
}

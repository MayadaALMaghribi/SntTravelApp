import 'package:flutter/material.dart';
import 'package:sntegpito/Features/medical/presentation/views/widgets/feature_card_destinations_medical.dart';
import '../../../../Destionations/presentation/views/feature_activity_view.dart';

class ListViewDestinationsMedical extends StatelessWidget {
  const ListViewDestinationsMedical({super.key});

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
                    // FeatureActivityView هتتغير
                    builder: (context) => const ListViewDestinationsMedical()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 8, right: 10, bottom: 2),
              child: FeatureCardDestinationsMedical(),
            ),
          );
        },
      ),
    );
  }
}

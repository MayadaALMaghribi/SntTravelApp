import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_card_activity_city.dart';

class ListViewTabBarActivity extends StatelessWidget {
  const ListViewTabBarActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: CustomCardActivityCity(),
          );
        },
      ),
    );
  }
}

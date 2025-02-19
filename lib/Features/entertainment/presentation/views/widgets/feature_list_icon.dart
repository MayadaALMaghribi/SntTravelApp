import 'package:flutter/material.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/feature_card_icon.dart';

class FeatureListIcon extends StatelessWidget {
  const FeatureListIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FeatureCardIcon(icon: "assets/images/hotel_icon.png", text: "Hotels"),
        FeatureCardIcon(icon: "assets/images/home_icon.png", text: "Home"),
        FeatureCardIcon(icon: "assets/images/flight_icon.png", text: "Flights"),
      ],
    );
  }
}

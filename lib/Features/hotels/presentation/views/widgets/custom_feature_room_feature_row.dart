import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_feature_room.dart';

// ignore: must_be_immutable
class CustomFeatureRoomFeaturesGrid extends StatelessWidget {
  CustomFeatureRoomFeaturesGrid({
    super.key,
  });
  final List<CustomCardFeatureRoom> customCardFeatureRoom = [
    const CustomCardFeatureRoom(
      text: "Private Bathroom",
      icon: Icons.bathtub_outlined,
    ),
    const CustomCardFeatureRoom(
      text: "Swimming Pool",
      icon: Icons.pool_outlined,
    ),
    const CustomCardFeatureRoom(
      icon: Icons.flatware_outlined,
      text: "Fine Dining",
    ),
    const CustomCardFeatureRoom(
      icon: Icons.waves_outlined,
      text: "Water sports",
    ),
    const CustomCardFeatureRoom(
      icon: Icons.pets_outlined,
      text: " Pet Friendly ",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 14,
          childAspectRatio: 4.5),
      itemCount: customCardFeatureRoom.length,
      itemBuilder: (context, index) {
        return customCardFeatureRoom[index];
      },
    );
  }
}

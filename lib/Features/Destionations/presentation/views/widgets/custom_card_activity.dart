import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/custom_card_activity_image.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/rating_test.dart';
import '../../../../../core/utils/styles.dart';

class CustomCardAcitvity extends StatelessWidget {
  const CustomCardAcitvity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Container(
        width: 350,
        height: 265,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xff868686), width: 1),
        ),
        child: Column(
          children: [
            const CustomCardActivityImage(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 12, right: 12, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Al Alamein Hotel",
                    style: Styles.textStyle17.copyWith(fontSize: 20),
                  ),
                  const Text(
                    "1000 EGP/day",
                    style: Styles.textStyle14,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, bottom: 14),
              child: Row(
                children: [
                  Icon(Icons.place_outlined, size: 22),
                  Text(" Sidi Abd El Rahman area", style: Styles.textStyle12),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: RatingTest(),
            ),
          ],
        ),
      ),
    );
  }
}

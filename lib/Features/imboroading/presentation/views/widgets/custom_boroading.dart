import 'package:flutter/material.dart';
import 'package:sntegpito/Features/imboroading/presentation/views/widgets/custom_image_boroading.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/boroading_model.dart';

class CustomBoroading extends StatelessWidget {
  const CustomBoroading({super.key, required this.items});
  final BoroadingModel items;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, 0.8),
          radius: 0.7,
          colors: [
            Color(0xFF61B4F0),
            Color(0xFFE5F8FD),
          ],
          stops: [0.3, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: width(context) * 0.1, // نسبة من ارتفاع الشاشة
            left: width(context) * 0.05, // نسبة من عرض الشاشة
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items.title_up,
                  style: Styles.textStyles24,
                ),
                Text(
                  items.titleBold,
                  style: Styles.textStyle32,
                ),
                Text(
                  items.title,
                  style: Styles.textStyles24,
                ),
                SizedBox(height: height(context) * 0.02),
                Text(
                  items.subtitle,
                  style: Styles.textStyle16,
                ),
              ],
            ),
          ),
          CustomImageBoroading(imageUrl: items.image),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../core/helpers/icon_maper_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomCardFeatureRoom extends StatelessWidget {
  const CustomCardFeatureRoom({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final iconData = iconMapper[icon];
    if (iconData == null) {
      debugPrint('⚠️ Unknown icon name received: $icon');
    }

    return Container(
      height: 38,
      constraints: const BoxConstraints(maxWidth: 140),
      decoration: BoxDecoration(
          color: const Color(0xffD6D6D6),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            iconData ?? Icons.help_center_outlined,
            color: const Color(0xff838383),
            size: 24,
          ),
          Text(text, style: Styles.textStyle12)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomCardFeatureRoom extends StatelessWidget {
  const CustomCardFeatureRoom(
      {super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      constraints: const BoxConstraints(maxWidth: 140),
      decoration: const BoxDecoration(
        color: Color(0xffD6D6D6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: const Color(0xff838383),
          ),
          Text(text, style: Styles.textStyle12)
        ],
      ),
    );
  }
}

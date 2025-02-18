import 'package:flutter/material.dart';

class FeatureCardIcon extends StatelessWidget {
  const FeatureCardIcon({super.key, required this.icon, required this.text});
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 75,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffC9C9C9), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Image.asset(
                icon,
                width: 60,
                height: 32,
              ),
            ),
          ),
          Text(
            text,
          )
        ],
      ),
    );
  }
}

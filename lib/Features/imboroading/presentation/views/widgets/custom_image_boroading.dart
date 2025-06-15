import 'package:flutter/material.dart';
import '../../../../../core/utils/constant.dart';

class CustomImageBoroading extends StatelessWidget {
  const CustomImageBoroading({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: width(context) * 0.02,
        left: width(context) * 0.06,
        child: Image.asset(imageUrl,
            width: width(context) * 0.9,
            height: height(context) * 0.7,
            fit: BoxFit.contain));
  }
}

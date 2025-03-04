import 'package:flutter/material.dart';

class CustomCardActivityImageHotel extends StatelessWidget {
  const CustomCardActivityImageHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      child: Image.asset(
        "assets/images/home_entrat.jpg",
        width: double.infinity,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }
}

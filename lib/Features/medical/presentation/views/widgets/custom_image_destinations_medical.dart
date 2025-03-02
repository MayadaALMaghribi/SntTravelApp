import 'package:flutter/material.dart';

class CustomImageDestinationsMedical extends StatelessWidget {
  const CustomImageDestinationsMedical({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      // width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          "assets/images/home_entrat.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

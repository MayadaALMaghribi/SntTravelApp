import 'package:flutter/material.dart';

class CustomImageActivityBooked extends StatelessWidget {
  const CustomImageActivityBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.blueAccent,
          child: Image.asset(
            "assets/destionation/temple.jpeg",
            width: 95,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

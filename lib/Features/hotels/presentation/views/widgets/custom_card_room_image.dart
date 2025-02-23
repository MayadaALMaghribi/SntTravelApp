
import 'package:flutter/material.dart';

class CustomCardRoomImage extends StatelessWidget {
  const CustomCardRoomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Image.asset(
        "assets/images/room.jpg",
        width: double.infinity,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }
}
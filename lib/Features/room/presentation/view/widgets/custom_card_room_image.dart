import 'package:flutter/material.dart';

class CustomCardRoomImage extends StatelessWidget {
  const CustomCardRoomImage({super.key, required this.imageurl});
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Image.network(
        imageurl,
        width: double.infinity,
        height: 170,
        fit: BoxFit.cover,
      ),
    );
  }
}

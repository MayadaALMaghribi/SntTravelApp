import 'package:flutter/material.dart';

class CustomCardActivityImage extends StatelessWidget {
  const CustomCardActivityImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      child: Image(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 140,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomCardImageCol extends StatelessWidget {
  const CustomCardImageCol({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Image(
        image: NetworkImage( imageUrl),
        width: double.infinity,
        height: 220,
        fit: BoxFit.cover,
      ),
    );
  }
}

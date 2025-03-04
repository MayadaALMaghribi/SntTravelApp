import 'package:flutter/material.dart';

class CustomImageDestinations extends StatelessWidget {
  const CustomImageDestinations({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      // width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

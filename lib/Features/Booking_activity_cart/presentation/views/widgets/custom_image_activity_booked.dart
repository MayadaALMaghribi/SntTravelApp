import 'package:flutter/material.dart';
import 'package:sntegpito/core/api/end_ponits.dart';

class CustomImageActivityBooked extends StatelessWidget {
  const CustomImageActivityBooked({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blueAccent,
          child: Image.network(
            EndPoint.baseImageUrl + imageUrl,
            width: 95,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomCardFeedtimeImage extends StatelessWidget {
  const CustomCardFeedtimeImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            color: Colors.blueAccent,
            child: Image.network(
              image,
              width: 95,
              height: 110,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

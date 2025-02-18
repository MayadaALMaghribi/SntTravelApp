import 'package:flutter/material.dart';
import 'package:sntegpito/core/utils/styles.dart';

class RatingTest extends StatelessWidget {
  const RatingTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 25)),
        ),
        const SizedBox(width: 8), // مسافة بين النجوم والتقييم
        const Text("(4.5)", style: Styles.textStyle12),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomDishedLine extends StatelessWidget {
  const CustomDishedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          20,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                height: 2,
                color: const Color(0xFF888888),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomCheckItemIcon extends StatelessWidget {
  const CustomCheckItemIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 0,
      top: -50,
      right: 0,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Color(0xFFD9D9D9),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.check,
            size: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

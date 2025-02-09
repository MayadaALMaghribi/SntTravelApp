import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() ontap;
  final double width;
  const CustomButton(
      {super.key,
      required this.title,
      required this.ontap,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // استخدام SizedBox بدلاً من Container هنا
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff49AEE4),
        ),
        onPressed: ontap,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

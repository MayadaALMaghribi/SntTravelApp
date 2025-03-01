import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Function() ontap;
  // final double width;
  const CustomButton({
    super.key,
    required this.child,
    required this.ontap,
    //required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // استخدام SizedBox بدلاً من Container هنا
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff49AEE4),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(double.infinity, 48),
        ),
        onPressed: ontap,
        child: child,
      ),
    );
  }
}

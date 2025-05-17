import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.page});
  final String text;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          // أيقونة الرجوع
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 35,
            ),
          ),
          const Spacer(flex: 2), // يضيف فراغ بين الأيقونة والنص
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(flex: 3), // يضيف فراغ بين النص ونهاية الصف
        ],
      ),
    );
  }
}

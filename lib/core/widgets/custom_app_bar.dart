import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.page});
  final String text;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // أيقونة الرجوع
          InkWell(
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) => page),
              //   (Route) => false,
              // );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: const Icon(
                Icons.chevron_left,
                size: 25,
              ),
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

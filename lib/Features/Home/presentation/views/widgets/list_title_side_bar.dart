import 'package:flutter/material.dart';
import '../../../../../core/utils/constant.dart';

class ListSideBar extends StatelessWidget {
  const ListSideBar({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 75, 154, 237).withOpacity(0.3),
        ),
        child: Icon(
          icon,
          size: width(context) * 0.06,
        ),
      ),
      onTap: onTap, // استدعاء الدالة عند النقر
    );
  }
}

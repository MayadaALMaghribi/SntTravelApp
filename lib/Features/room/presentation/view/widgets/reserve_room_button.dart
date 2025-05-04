
import 'package:flutter/material.dart';

class ReserveRoomButton extends StatelessWidget {
  const ReserveRoomButton({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9, right: 15, left: 15, bottom: 9),
      child: Center(
        child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff247CFF),
            foregroundColor: Colors.white,
            fixedSize: const Size(304, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

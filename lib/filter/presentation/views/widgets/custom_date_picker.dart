import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker(
      {super.key, required this.label, required this.textController});
  String label;
  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2030),
        );

        if (picked != null) {
          textController.text =
              picked.toIso8601String().split('T')[0]; // بصيغة yyyy-MM-dd
        }
      },
    );
  }
}

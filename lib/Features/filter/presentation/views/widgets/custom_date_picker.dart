import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDatePicker extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomDatePicker({
    super.key,
    required this.label,
    required this.textController,
  });

  final String label;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
      readOnly: true,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2030),
          builder: (BuildContext context, Widget? child) {
            return ThemeofDate(context, child);
          },
        );

        if (picked != null) {
          textController.text = picked.toString().split('T')[0];
        }
      },
    );
  }

  Theme ThemeofDate(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
          onSurface: Colors.black,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blueAccent,
          ),
        ),
      ),
      child: child!,
    );
  }
}

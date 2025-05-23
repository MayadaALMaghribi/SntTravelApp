import 'package:flutter/material.dart';

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

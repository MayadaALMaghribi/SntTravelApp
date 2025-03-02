import 'package:flutter/material.dart';

class Medicalview extends StatelessWidget {
  const Medicalview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Religious Tourism")),
      body: const Center(
        child: Text(
          "Welcome to Religious Tourism Page!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

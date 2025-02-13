import 'package:flutter/material.dart';

class EnvironmentalTourism extends StatelessWidget {
  const EnvironmentalTourism({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Entertainment Tourism")),
      body: const Center(
        child: Text(
          "Welcome to Entertainment Tourism Page!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

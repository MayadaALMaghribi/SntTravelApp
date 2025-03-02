import 'package:flutter/material.dart';

class ArchaeologicalTourism extends StatelessWidget {
  const ArchaeologicalTourism({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Entertainment Tourism")),
      body: const Center(
        child: Text(
          "Welcome to Archaeological Tourism Page!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

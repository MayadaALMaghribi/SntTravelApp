import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.icon,
      required this.texthint});
  final bool obscureText;
  final String texthint;
  final IconData icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: texthint,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          fillColor: const Color.fromARGB(255, 241, 238, 238),
          filled: true,
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
//  obscureText: obscureText,
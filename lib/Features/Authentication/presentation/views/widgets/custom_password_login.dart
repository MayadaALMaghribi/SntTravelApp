import 'package:flutter/material.dart';

class CustomPasswordLogin extends StatefulWidget {
  final TextEditingController controller;
  const CustomPasswordLogin({required this.controller, super.key});

  @override
  State<CustomPasswordLogin> createState() => _CustomPasswordLoginState();
}

class _CustomPasswordLoginState extends State<CustomPasswordLogin> {
  bool isChecked = false;
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // استخدام TextEditingController
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Password';
        }
        return null;
      },
      obscureText: !isPasswordVisible,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        //hintText: '',
        hintStyle: const TextStyle(
          color: Colors.black54,
        ),
        fillColor: const Color.fromARGB(255, 241, 238, 238),
        filled: true,
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
            color: Colors.black,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
      ),
    );
  }
}

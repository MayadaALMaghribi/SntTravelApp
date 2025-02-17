import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final bool obscureText;
  final TextEditingController
      controller; // تم تعديل المتغير ليكون من نوع TextEditingController
  //final String hintText;
  final String? Function(String?)?
      validator; // إضافة validator لتتمكن من التحقق من صحة المدخلات

  const CustomTextformfield({
    super.key,
    required this.obscureText,
    required this.controller,
    //required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        controller: controller, // تم تمرير الـ controller هنا
        obscureText: obscureText,
        cursorColor: Colors.black,
        validator: validator, // استخدام الـ validator هنا
        decoration: InputDecoration(
          // hintText: hintText,  // عرض hintText في الـ InputDecoration
          hintStyle: const TextStyle(
            color: Colors.white,
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
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomCheckboxLogin extends StatefulWidget {
  const CustomCheckboxLogin({super.key});

  @override
  State<CustomCheckboxLogin> createState() => _CustomCheckboxLoginState();
}

class _CustomCheckboxLoginState extends State<CustomCheckboxLogin> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: const Color(0xff49AEE4),
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        const Text('Remember Me'),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ForgetPage();
            }));
          },
          child: const Text(
            'Forget password?',
            style: TextStyle(
              color: Color(0xff49AEE4),
            ),
          ),
        ),
      ],
    );
  }
}

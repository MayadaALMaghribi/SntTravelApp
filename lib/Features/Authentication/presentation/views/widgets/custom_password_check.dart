import 'package:flutter/material.dart';

class PasswordStrengthChecker extends StatefulWidget {
  final TextEditingController passwordController;
   final String? Function(String?)?
      validator; 

  const PasswordStrengthChecker({super.key, required this.passwordController,required this.validator});

  @override
  State<PasswordStrengthChecker> createState() =>
      _PasswordStrengthCheckerState();
}

class _PasswordStrengthCheckerState extends State<PasswordStrengthChecker> {
  String password = '';
  bool isPasswordVisible = false;
   
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasDigits = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  
  // دالة للتحقق من شروط كلمة المرور
  void checkPassword(String value) {
    setState(() {
      password = value;
      hasUppercase = value.contains(RegExp(r'[A-Z]'));
      hasLowercase = value.contains(RegExp(r'[a-z]'));
      hasDigits = value.contains(RegExp(r'[0-9]'));
      hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      hasMinLength = value.length >= 8;
    });
  }

  // دالة لحساب مستوى القوة بالنقاط
  double calculateStrength() {
    double strength = 0;
    if (hasMinLength) strength += 0.2;
    if (hasLowercase) strength += 0.2;
    if (hasUppercase) strength += 0.2;
    if (hasDigits) strength += 0.2;
    if (hasSpecialCharacters) strength += 0.2;
    return strength;
  }

  // دالة للحصول على النص الخاص بقوة كلمة المرور
  String getStrengthLabel() {
    double strength = calculateStrength();
    if (strength == 1.0) {
      return "Strong";
    } else if (strength >= 0.6) {
      return "Medium";
    } else {
      return "Weak";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
             validator:widget.validator,
            onChanged: (value) {
              checkPassword(value);
            },
            controller: widget.passwordController, // استخدام passwordController
            obscureText: !isPasswordVisible,
            cursorColor: Colors.black,
            decoration: InputDecoration(
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
          ),
          const SizedBox(height: 20),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(15),
            value: calculateStrength(),
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              calculateStrength() == 1.0
                  ? Colors.green
                  : calculateStrength() >= 0.6
                      ? Colors.orange
                      : Colors.red,
            ),
            minHeight: 5,
          ),
          const SizedBox(height: 10),
          Text(
            " ${getStrengthLabel()}",
            style: TextStyle(
              fontSize: 15,
              color: calculateStrength() == 1.0
                  ? Colors.green
                  : calculateStrength() >= 0.6
                      ? Colors.orange
                      : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

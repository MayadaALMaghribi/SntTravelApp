import 'package:flutter/material.dart';
import 'package:sntegpito/Features/welcome_screen/presentation/views/welcome_view.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

import '../../../../../core/api/end_ponits.dart';

class CustomLogoutDialog extends StatelessWidget {
  const CustomLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20), // لإضافة مساحة حول المحتوى
        child: Column(
          mainAxisSize: MainAxisSize.min, // يجعل حجم الـ Container ديناميكي
          children: [
            const Icon(
              Icons.logout_outlined,
              color: Colors.blueAccent,
              size: 45,
            ),
            const SizedBox(height: 20),
            const Text(
              "Are you sure you want to leave?",
              textAlign: TextAlign.center, // توسيط النص
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // زر NO
                ElevatedButton(
                  onPressed: () {
                    // أكشن تسجيل الخروج
                    Navigator.of(context).pop(); // مثال لإغلاق النافذة
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    minimumSize: const Size(155, 40),

                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // حجم الزر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text(
                    "NO ,Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                // زر YES
                ElevatedButton(
                  onPressed: () {
                    // أكشن تسجيل الخروج
                    CacheHelper().clearData(key: ApiKey.token);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeView()),
                      //(route) => false,
                    ); // مثال لإغلاق النافذة
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(150, 40),
                    side: const BorderSide(
                      color: Colors.blueAccent,
                    ), // إضافة Border
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // حجم الزر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text(
                    "Yes, Log Me Out",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

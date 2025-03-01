import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/filter_view.dart';

class CustombuttonFilterHotel extends StatelessWidget {
  const CustombuttonFilterHotel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true, // يسمح بالإغلاق عند النقر خارج النافذة
          barrierLabel: "Close Filters", // ✅ إصلاح الخطأ هنا
          barrierColor: Colors.black.withOpacity(0.5), // تأثير الشفافية
          transitionDuration:
              const Duration(milliseconds: 300), // مدة الأنيميشن
          pageBuilder: (context, animation, secondaryAnimation) {
            return const FilterView();
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff247CFF),
          borderRadius: BorderRadius.circular(12),
        ),
        width: 66,
        height: 52,
        child: const Icon(
          Icons.sort_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}

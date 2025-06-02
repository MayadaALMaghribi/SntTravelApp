import 'package:flutter/material.dart';
import 'package:sntegpito/Features/filter/presentation/views/filter_view.dart';

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
          barrierDismissible: true,
          barrierLabel: "Close Filters",
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 300),
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

import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText({super.key, required this.textblack});
  final String textblack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34, bottom: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textblack,
            style: Styles.textStyle22.copyWith(
              color: const Color(0xff121212),
            ),
          ),
          const Text(
            "see all",
            style: Styles.textStyle20,
          ),
        ],
      ),
    );
  }
}

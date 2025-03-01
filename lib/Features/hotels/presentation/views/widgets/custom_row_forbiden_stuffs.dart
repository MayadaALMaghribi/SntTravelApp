import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomRowForbidenStuffs extends StatelessWidget {
  const CustomRowForbidenStuffs({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          const Icon(
            Icons.do_disturb_alt,
            color: Colors.red,
            size: 22,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Styles.textStyle17,
          )
        ],
      ),
    );
  }
}

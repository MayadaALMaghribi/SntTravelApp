// import 'package:flutter/material.dart';

// class CustomDropDownTextfield extends StatelessWidget {
//   CustomDropDownTextfield({super.key, required this.label});
//   String label;
//   //TextEditingController textEditingController;
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<int>(
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       items: List.generate(
//           5,
//           (index) =>
//               DropdownMenuItem(value: index + 1, child: Text("${index + 1}"))),
//       onChanged: (value) {},
//     );
//   }
// }

import 'package:flutter/material.dart';
class CustomDropDownTextfield extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;

  const CustomDropDownTextfield({
    super.key,
    required this.label,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: List.generate(
        5,
        (index) => DropdownMenuItem(value: index + 1, child: Text("${index + 1}")),
      ),
      onChanged: (value) {
        if (value != null) {
          textEditingController.text = value.toString(); // هنا التحديث الحقيقي
        }
      },
    );
  }
}

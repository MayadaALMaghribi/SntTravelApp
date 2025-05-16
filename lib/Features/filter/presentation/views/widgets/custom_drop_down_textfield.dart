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
      value: textEditingController.text.isNotEmpty
          ? int.tryParse(textEditingController.text)
          : null,
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: List.generate(
        5,
        (index) =>
            DropdownMenuItem(value: index + 1, child: Text("${index + 1}")),
      ),
      onChanged: (value) {
        if (value != null) {
          textEditingController.text = value.toString();
        }
      },
      validator: (value) {
        if (value == null || value == 0) {
          return 'Please select $label';
        }
        return null;
      },
    );
  }
}

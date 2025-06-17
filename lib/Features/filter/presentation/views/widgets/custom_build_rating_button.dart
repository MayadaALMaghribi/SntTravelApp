// import 'package:flutter/material.dart';

// class CustomBuildRatingButton extends StatefulWidget {
//   final Function(int) onRatingSelected;

//   const CustomBuildRatingButton({
//     super.key,
//     required this.onRatingSelected,
//   });

//   @override
//   State<CustomBuildRatingButton> createState() =>
//       _CustomBuildRatingButtonState();
// }

// class _CustomBuildRatingButtonState extends State<CustomBuildRatingButton> {
//   int? selectedRating; // كانت 3، خليناها null

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(
//         4,
//         (index) {
//           int rating = index + 1;
//           bool isSelected = selectedRating == rating;

//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedRating = rating;
//               });
//               widget.onRatingSelected(rating); // بيرجع القيمة بعد الضغط
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                 color: isSelected ? Colors.blue : Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.star,
//                       color: isSelected ? Colors.white : Colors.black),
//                   const SizedBox(width: 4),
//                   Text(
//                     "$rating.0",
//                     style: TextStyle(
//                         color: isSelected ? Colors.white : Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomBuildRatingButton extends StatefulWidget {
  final Function(int) onRatingSelected;
  final int initialRating; // <-- إضافة

  const CustomBuildRatingButton({
    super.key,
    required this.onRatingSelected,
    required this.initialRating, // <-- لازم نبعتها
  });

  @override
  State<CustomBuildRatingButton> createState() =>
      _CustomBuildRatingButtonState();
}

class _CustomBuildRatingButtonState extends State<CustomBuildRatingButton> {
  late int selectedRating;

  @override
  void initState() {
    super.initState();
    selectedRating = widget.initialRating; // <-- أخدنا القيمة المبدئية من برة
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (index) {
          int rating = index + 1;
          bool isSelected = selectedRating == rating;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedRating = rating;
              });
              widget.onRatingSelected(rating);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.star,
                      color: isSelected ? Colors.white : Colors.black),
                  const SizedBox(width: 4),
                  Text(
                    "$rating.0",
                    style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

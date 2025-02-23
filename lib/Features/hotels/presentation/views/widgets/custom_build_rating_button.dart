import 'package:flutter/material.dart';

class CustomBuildRatingButton extends StatefulWidget {
  const CustomBuildRatingButton({super.key});

  @override
  State<CustomBuildRatingButton> createState() =>
      _CustomBuildRatingButtonState();
}

class _CustomBuildRatingButtonState extends State<CustomBuildRatingButton> {
  int? selectedRating = 3;

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

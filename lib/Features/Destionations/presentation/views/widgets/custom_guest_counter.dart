 import 'package:flutter/material.dart';

// class CustomGuestCounter extends StatefulWidget {
//   final String label;
//   final TextEditingController textEditingController;

//   const CustomGuestCounter({
//     super.key,
//     required this.label,
//     required this.textEditingController,
//   });

//   @override
//   State<CustomGuestCounter> createState() => _CustomGuestCounterState();
// }

// class _CustomGuestCounterState extends State<CustomGuestCounter> {
//   late int currentValue;

//   @override
//   void initState() {
//     super.initState();
//     final initial = int.tryParse(widget.textEditingController.text);
//     currentValue = initial != null && initial > 0 ? initial : 1;
//     widget.textEditingController.text = currentValue.toString();
//   }

//   void _updateValue(int newValue) {
//     if (newValue >= 1 && newValue <= 20) {
//       setState(() {
//         currentValue = newValue;
//         widget.textEditingController.text = currentValue.toString();
//         widget.textEditingController.selection = TextSelection.fromPosition(
//           TextPosition(offset: widget.textEditingController.text.length),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       child: Row(
//         children: [
//           Text(
//             "${widget.label}:",
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(width: 12),
//           Container(
//             width: 130,
//             height: 40,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.shade400),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.remove),
//                   onPressed: currentValue > 1
//                       ? () => _updateValue(currentValue - 1)
//                       : null,
//                 ),
//                 Text(
//                   "$currentValue",
//                   style: const TextStyle(fontSize: 16),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: currentValue < 20
//                       ? () => _updateValue(currentValue + 1)
//                       : null,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class CustomGuestCounter extends StatefulWidget {
  final String label;
  final TextEditingController textEditingController;
  final ValueChanged<int> onValueChanged; // callback to notify the parent widget

  const CustomGuestCounter({
    super.key,
    required this.label,
    required this.textEditingController,
    required this.onValueChanged,
  });

  @override
  State<CustomGuestCounter> createState() => _CustomGuestCounterState();
}

class _CustomGuestCounterState extends State<CustomGuestCounter> {
  late int currentValue;

  @override
  void initState() {
    super.initState();
    final initial = int.tryParse(widget.textEditingController.text);
    currentValue = initial != null && initial > 0 ? initial : 1;
    widget.textEditingController.text = currentValue.toString();
  }

  void _updateValue(int newValue) {
    if (newValue >= 1 && newValue <= 20) {
      setState(() {
        currentValue = newValue;
        widget.textEditingController.text = currentValue.toString();
        widget.onValueChanged(currentValue); // Notify the parent widget
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [
          Text(
            "${widget.label}:",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 12),
          Container(
            width: 130,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: currentValue > 1
                      ? () => _updateValue(currentValue - 1)
                      : null,
                ),
                Text(
                  "$currentValue",
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: currentValue < 20
                      ? () => _updateValue(currentValue + 1)
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


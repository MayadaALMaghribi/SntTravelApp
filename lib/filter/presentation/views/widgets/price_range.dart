import 'package:flutter/material.dart';

class PriceRange extends StatefulWidget {
  const PriceRange({super.key});

  @override
  State<PriceRange> createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  double _minPrice = 350;

  double _maxPrice = 1300;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const Text("Price range",
        //     style: TextStyle(fontWeight: FontWeight.bold)),
        // const SizedBox(
        //   height: 24,
        // ),
        RangeSlider(
          values: RangeValues(_minPrice, _maxPrice),
          min: 350,
          max: 1300,
          divisions: 10,
          activeColor: Colors.blue,
          labels: RangeLabels(
            "\$${_minPrice.toInt()}",
            "\$${_maxPrice.toInt()}",
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _minPrice = values.start;
              _maxPrice = values.end;
            });
          },
        ),
        // عشان احط السعر تحت ال slider
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${_minPrice.toInt()}",
                style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("\$${_maxPrice.toInt()}",
                style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}

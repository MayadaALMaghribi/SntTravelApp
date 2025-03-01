import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/search_hotel.dart';

class CustomFunctionSearchHotel extends StatelessWidget {
  const CustomFunctionSearchHotel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Which place would you like ?",
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          fillColor: const Color.fromARGB(255, 241, 238, 238),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xff868686),
            ),
          ),
          //contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onTap: () {
          showSearch(context: context, delegate: SearchHotel());
        },
      ),
    );
  }
}

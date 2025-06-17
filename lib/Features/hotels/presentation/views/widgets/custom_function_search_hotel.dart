import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/search_hotel.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/utils/constant.dart';

class CustomFunctionSearchHotel extends StatefulWidget {
  const CustomFunctionSearchHotel({super.key});

  @override
  State<CustomFunctionSearchHotel> createState() =>
      CustomFunctionSearchHotelState();
}

class CustomFunctionSearchHotelState extends State<CustomFunctionSearchHotel> {
  String? selectedCity;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _loadCityName();
    CacheHelper().saveData(key: Constants.verify_filter, value: false);
  }

  void _loadCityName() {
    final cachedCity = CacheHelper().getData(key: Constants.cityName);

    setState(() {
      selectedCity = cachedCity;
      hasError = false;
    });
  }

  void _openSearchAndRefresh() async {
    await showSearch(context: context, delegate: SearchHotel());
    _loadCityName();
  }

  void showError() {
    setState(() {
      hasError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 330,
          child: TextField(
            readOnly: true,
            onTap: _openSearchAndRefresh,
            decoration: InputDecoration(
              hintText: selectedCity ?? "Which place would you like?",
              hintStyle: hasError ? const TextStyle(color: Colors.red) : null,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              fillColor: const Color.fromARGB(255, 241, 238, 238),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(color: hasError ? Colors.red : Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                    color: hasError ? Colors.red : const Color(0xff868686)),
              ),
            ),
          ),
        ),
        if (hasError)
          const Padding(
            padding: EdgeInsets.only(top: 6.0, left: 8),
            child: Text(
              "Please enter name of hotel or city",
              style: TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
      ],
    );
  }
}

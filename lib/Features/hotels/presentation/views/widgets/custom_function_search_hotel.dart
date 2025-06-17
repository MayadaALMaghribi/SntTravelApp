import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/search_hotel.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../filter/presentation/manager/filter_by_date_and_gests/hotel_filter_cubit.dart';

class CustomFunctionSearchHotel extends StatefulWidget {
  const CustomFunctionSearchHotel({
    super.key,
  });

  @override
  State<CustomFunctionSearchHotel> createState() =>
      _CustomFunctionSearchHotelState();
}

class _CustomFunctionSearchHotelState extends State<CustomFunctionSearchHotel> {
  String? selectedCity;
  @override
  void initState() {
    super.initState();
    _loadCityName();
  }
  //are done الحمدالله

  void _loadCityName() {
    final cachedCity = CacheHelper().getData(key: Constants.cityName);
    CacheHelper().saveData(key: Constants.verify_filter, value: false);

    setState(() {
      selectedCity = cachedCity;
    });
  }

  void _openSearchAndRefresh() async {
    await showSearch(context: context, delegate: SearchHotel());

    // بعد ما يرجع من البحث، نعيد تحميل اسم المدينة ونعمل setState
    _loadCityName();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: TextField(
        readOnly: true,
        onTap: _openSearchAndRefresh,
        decoration: InputDecoration(
          hintText: selectedCity ?? "Which place would you like ?",
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          fillColor: const Color.fromARGB(255, 241, 238, 238),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xff868686)),
          ),
        ),
      ),
    );
  }
}

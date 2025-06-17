import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_button_filter_hotel.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_function_search_hotel.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_list_view_search_hotel.dart';

class HomeHotelViewBody extends StatelessWidget {
  HomeHotelViewBody({super.key});
  final searchFieldKey = GlobalKey<CustomFunctionSearchHotelState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustombuttonFilterHotel(),
                  // CustomFunctionSearchHotel(),
                  CustomFunctionSearchHotel(key: searchFieldKey),
                ],
              ),
              CustomListViewSearchHotel(searchFieldKey: searchFieldKey),
              //CustomListViewSearchHotel()
            ],
          ),
        ),
      ),
    );
  }
}

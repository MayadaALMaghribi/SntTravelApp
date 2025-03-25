import 'package:flutter/material.dart';

import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_button_filter_hotel.dart';

import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_function_search_hotel.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_list_view_search_hotel.dart';

class HomeHotelViewBody extends StatelessWidget {
  const HomeHotelViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustombuttonFilterHotel(),
                    CustomFunctionSearchHotel(),
                  ],
                ),
              ),
              CustomListViewSearchHotel()
            ],
          ),
        ),
      ),
    );
  }
}


/**
 * Padding(
                  padding: const EdgeInsets.only(top: 170, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const HotelDetailsView();
                        }),
                      );
                    },
                    child: Image.asset(
                      "assets/images/search_hotel.png",
                      width: 250,
                    ),
                  ),
                ),
                const Text("Let's get started !", style: Styles.textStyle17),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "search for hotel name to see our best daels",
                  style: Styles.textStyle16,
                )*/

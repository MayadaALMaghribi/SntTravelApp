import 'package:flutter/material.dart';
import 'package:sntegpito/Features/entertainment/presentation/views/widgets/feature_card_icon.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

import '../../../../hotels/presentation/views/home_hotel_view.dart';

class FeatureListIcon extends StatelessWidget {
  const FeatureListIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FeatureCardIcon(
          icon: "assets/images/hotel_icon.png",
          text: "Hotels",
          ontap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomeHotelView();
            }));
            CacheHelper().removeData(key: "cityName");
          },
        ),
        FeatureCardIcon(
          icon: "assets/images/home_icon.png",
          text: "Home",
          ontap: () {
            Navigator.pop(context);
          },
        ),
        // FeatureCardIcon(
        //   icon: "assets/images/flight_icon.png",
        //   text: "Flights",
        //   ontap: () {},
        // ),
      ],
    );
  }
}

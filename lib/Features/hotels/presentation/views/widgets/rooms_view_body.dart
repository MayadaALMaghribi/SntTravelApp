import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/home_hotel_view.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/list_view_rooms.dart';
import 'package:sntegpito/core/utils/styles.dart';
import 'package:sntegpito/core/widgets/custom_app_bar.dart';

class RoomsViewBody extends StatelessWidget {
  const RoomsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppBar(
            text: "",
            page: HomeHotelView(),
          ),
        ),
        backgroundColor: const Color(0xffFFFFFF),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Rooms',
                style: Styles.textStyle22.copyWith(
                  color: const Color(0xff121212),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const ListViewRooms(),
            ],
          ),
        ),
      ),
    );
  }
}

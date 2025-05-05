import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/room/presentation/manager/room_cubit/roomshotel_cubit.dart';
import 'package:sntegpito/Features/room/presentation/view/rooms_view.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_feature_room_feature_row.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_gallary_details_hotel.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_list_view_search_hotel.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_row_forbiden_stuffs.dart';
import 'package:sntegpito/core/widgets/custom_app_bar.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../Destionations/presentation/views/widgets/rating_test.dart';

class HotelDetailsViewBody extends StatelessWidget {
  const HotelDetailsViewBody(
      {super.key, required this.text, required this.location});
  final String text;
  final String location;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppBar(
            text: "",
            page: CustomListViewSearchHotel(),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomGallaryDetailsHotel(),
                    Text(
                      text,
                      style: Styles.textStyle22.copyWith(color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.place_outlined, size: 24),
                          Expanded(
                            child: Text(
                              location,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle17.copyWith(
                                color: const Color(0xff838383),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: RatingTest(),
                    ),
                    Text(
                      "Room features",
                      style: Styles.textStyle20.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomFeatureRoomFeaturesGrid(),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Forbidden stuffs",
                      style: Styles.textStyle20.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomRowForbidenStuffs(
                        text: "Outside Food & Drinks"),
                    const CustomRowForbidenStuffs(text: "Drones"),
                    const CustomRowForbidenStuffs(
                        text: "Weapons & Hazardous Items"),
                    const CustomRowForbidenStuffs(text: "Smoking"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      child: const Text(
                        "Reserve a property",
                        style: Styles.textStyle22,
                      ),
                      ontap: () {
                        context.read<RoomsHotelCubit>().getHotelRoomsById();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const RoomsView();
                          //HotelDetailsViewBody
                          //RoomsView
                        }));
                      },
                    )
                  ],
                ),
              ),
            ),
            const SliverFillRemaining(),
          ],
        ),
      ),
    );
  }
}

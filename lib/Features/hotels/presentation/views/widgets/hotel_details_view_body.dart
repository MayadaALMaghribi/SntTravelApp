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
  const HotelDetailsViewBody({
    super.key,
    required this.text,
    required this.location,
  });

  final String text;
  final String location;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: const PreferredSize(
        //   preferredSize: Size.fromHeight(90),
        //   child: CustomAppBar(
        //     text: "",
        //     page: CustomListViewSearchHotel(),
        //   ),
        // ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth >= 600;

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: IconButton(
                    alignment: Alignment.topLeft,
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 32.0 : 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomGallaryDetailsHotel(),
                        const SizedBox(height: 16),
                        Text(
                          text,
                          style: Styles.textStyle22.copyWith(
                            fontSize: isTablet ? 26 : 22,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.place_outlined, size: 24),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                location,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.textStyle17.copyWith(
                                  fontSize: isTablet ? 18 : 16,
                                  color: const Color(0xff838383),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: RatingTest(),
                        ),
                        Text(
                          "Room features",
                          style: Styles.textStyle20.copyWith(
                            fontSize: isTablet ? 22 : 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const CustomFeatureRoomFeaturesGrid(),
                        const SizedBox(height: 32),
                        Text(
                          "Forbidden stuffs",
                          style: Styles.textStyle20.copyWith(
                            fontSize: isTablet ? 22 : 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const CustomRowForbidenStuffs(
                            text: "Outside Food & Drinks"),
                        const CustomRowForbidenStuffs(text: "Drones"),
                        const CustomRowForbidenStuffs(
                            text: "Weapons & Hazardous Items"),
                        const CustomRowForbidenStuffs(text: "Smoking"),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            child: Text(
                              "Reserve a property",
                              style: Styles.textStyle22.copyWith(
                                fontSize: isTablet ? 24 : 22,
                              ),
                            ),
                            ontap: () {
                              context
                                  .read<RoomsHotelCubit>()
                                  .getHotelRoomsById();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const RoomsView();
                              }));
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

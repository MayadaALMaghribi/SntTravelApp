import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/data/models/search_hotel_by_name_model.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/room_cubit/roomshotel_cubit.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../Destionations/presentation/views/widgets/custom_card_activity_image.dart';
import '../../../../Destionations/presentation/views/widgets/rating_test.dart';
import '../rooms_view.dart';

class CustomCardHotel extends StatelessWidget {
  const CustomCardHotel({super.key, required this.searchHotelByNameModel});
  final SearchHotelByNameModel searchHotelByNameModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CacheHelper()
            .saveData(key: 'hotel_id', value: searchHotelByNameModel.hotelId);
        context.read<RoomsHotelCubit>().getHotelRoomsById();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const RoomsView();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Container(
          width: 350,
          height: 265,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xff868686), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCardActivityImage(
                imageUrl: searchHotelByNameModel.firstImageUrl != null &&
                        searchHotelByNameModel.firstImageUrl!.isNotEmpty
                    ? "${EndPoint.baseImageUrl}${searchHotelByNameModel.firstImageUrl}"
                    : "http://tourism.runasp.net/Images/Locations/AlAlamein/AlAlamein.jpg",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, bottom: 10),
                child: Text(
                  textAlign: TextAlign.start,
                  searchHotelByNameModel.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle17.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.place_outlined, size: 22),
                    Expanded(
                      child: Text(searchHotelByNameModel.address!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle12),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: RatingTest(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

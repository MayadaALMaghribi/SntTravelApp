import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/data/models/hotel_rooms_model.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_room_image.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/reserve_room_button.dart';
import 'package:sntegpito/Features/payment/presentation/manager/booking_room/booking_room_cubit.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/utils/styles.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

class CustomCardRoom extends StatelessWidget {
  const CustomCardRoom({super.key, required this.roomsModel});
  final HotelRoomsModel roomsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Container(
        width: 360,
        height: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xff868686), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardRoomImage(
              imageurl: "${EndPoint.baseImageUrl}${roomsModel.roomImageUrl!}",
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 12, right: 12, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      roomsModel.roomName!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    '${roomsModel.pricePerNight} \$ Per Night',
                    style: Styles.textStyle14,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 14),
              child: Text(roomsModel.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle12),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Row(
                children: [
                  Text(
                    "Bed Count : ",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(roomsModel.bedCount.toString(),
                      style: Styles.textStyle16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Row(
                children: [
                  Text(
                    "Max Occupancy : ",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(roomsModel.maxOccupancy.toString(),
                      style: Styles.textStyle16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Row(
                children: [
                  Text(
                    "Room State : ",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  roomsModel.isAvailable == true
                      ? Text(
                          "available",
                          style: Styles.textStyle20.copyWith(fontSize: 18),
                        )
                      : Text(
                          "not available",
                          style: Styles.textStyle20.copyWith(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                ],
              ),
            ),
            BlocListener<BookingRoomCubit, BookingRoomState>(
              listener: (context, state) {
                if (state is BookingRoomLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BookingRoomFailure) {
                  CustomSnackBar.show(context, state.errmessage, isError: true);
                } else if (state is BookingRoomSuccess) {
                  CustomSnackBar.show(
                      context, state.responseBookingRoomModel.message!);
                     // Navigator.push(context, route)
                }
              },
              child: ReserveRoomButton(
                text: "Reserve a room",
                ontap: () {
                  context.read<BookingRoomCubit>().bookingRoom(
                      startdate: CacheHelper().getData(key: Constants.fromDate),
                      enddate: CacheHelper().getData(key: Constants.toDate),
                      userid: Constants.useridFav,
                      roomid: roomsModel.roomId!,
                      paymethod: 1,
                      numofguest: CacheHelper().getData(key: Constants.guests));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

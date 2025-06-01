import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/room/data/models/hotel_rooms_model.dart';
import 'package:sntegpito/Features/room/presentation/view/widgets/custom_card_room_image.dart';
import 'package:sntegpito/Features/room/presentation/view/widgets/reserve_room_button.dart';
import 'package:sntegpito/Features/payment/presentation/manager/booking_room/booking_room_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/views/payment_view.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/utils/styles.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

import '../../../../../core/utils/constant.dart';

class CustomCardRoom extends StatelessWidget {
  const CustomCardRoom({super.key, required this.roomsModel});
  final HotelRoomsModel roomsModel;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9; // 90% من عرض الشاشة

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: cardWidth,
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      roomsModel.roomName!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${roomsModel.pricePerNight} \$ Per Night',
                    style: Styles.textStyle14,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: Text(
                roomsModel.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 4),
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
              padding: const EdgeInsets.only(left: 8, bottom: 4),
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
              padding: const EdgeInsets.only(left: 8, bottom: 4),
              child: Row(
                children: [
                  Text(
                    "Room State : ",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    roomsModel.isAvailable == true
                        ? "available"
                        : "not available",
                    style: Styles.textStyle20.copyWith(
                      fontSize: 18,
                      color: roomsModel.isAvailable == true
                          ? Colors.blueAccent
                          : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            BlocListener<BookingRoomCubit, BookingRoomState>(
              listener: (context, state) {
                if (state is BookingRoomFailure) {
                  CustomSnackBar.show(context, state.errmessage, isError: true);
                } else if (state is BookingRoomSuccess) {
                  CustomSnackBar.show(
                      context, state.responseBookingRoomModel.message!);
                  CacheHelper().saveData(
                      key: Constants.bookingId,
                      value: state.responseBookingRoomModel.bookingId);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentView()),
                  );
                  CacheHelper().saveData(
                      key: Constants.transcationId,
                      value: state.responseBookingRoomModel.transactionId);
                }
              },
              child: ReserveRoomButton(
                text: "Reserve a room",
                ontap: () {
                  DateTime parsedStartDate = DateTime.parse(
                      CacheHelper().getData(key: Constants.fromDate));
                  DateTime parsedEndDate = DateTime.parse(
                      CacheHelper().getData(key: Constants.toDate));
                  String formattedStartDate = parsedStartDate.toIso8601String();
                  String formattedEndDate = parsedEndDate.toIso8601String();
                  context.read<BookingRoomCubit>().bookingRoom(
                        startdate: formattedStartDate,
                        enddate: formattedEndDate,
                        userid: CacheHelper().getData(key: Constants.userId),
                        roomid: roomsModel.roomId!,
                        paymethod: 1,
                        numofguest:
                            CacheHelper().getData(key: Constants.guests),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

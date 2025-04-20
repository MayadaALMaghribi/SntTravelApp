import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/data/models/hotel_rooms_model.dart';
import 'package:sntegpito/Features/filter/presentation/views/filter_view.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_room_image.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/utils/styles.dart';

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

            // extract widget
            Padding(
              padding:
                  const EdgeInsets.only(top: 9, right: 15, left: 15, bottom: 9),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return const FilterView();
                    // }));
                    // showModalBottomSheet(
                    //   context: context,
                    //   isScrollControlled: true, // يسمح بتمدد النافذة المنبثقة
                    //   shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.vertical(
                    //         top: Radius.circular(20)), // تدوير الزوايا
                    //   ),
                    //   builder: (context) => const FilterView(),
                    // );
                    showGeneralDialog(
                      context: context,
                      barrierDismissible:
                          true, // يسمح بالإغلاق عند النقر خارج النافذة
                      barrierLabel: "Close Filters", // ✅ إصلاح الخطأ هنا
                      barrierColor:
                          Colors.black.withOpacity(0.5), // تأثير الشفافية
                      transitionDuration:
                          const Duration(milliseconds: 300), // مدة الأنيميشن
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const FilterView();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff247CFF),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(304, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Reserve a room",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

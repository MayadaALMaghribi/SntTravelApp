import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Destionations/presentation/views/widgets/rating_test.dart';
import 'package:sntegpito/Features/hotels/presentation/views/filter_view.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_room_image.dart';
import 'package:sntegpito/core/utils/styles.dart';

class CustomCardRoom extends StatelessWidget {
  const CustomCardRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Container(
        width: 360,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xff868686), width: 1),
        ),
        child: Column(
          children: [
            const CustomCardRoomImage(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 12, right: 12, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Al Alamein Hotel",
                    style: Styles.textStyle17.copyWith(fontSize: 20),
                  ),
                  const Text(
                    "1000 EGP/day",
                    style: Styles.textStyle14,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, bottom: 14),
              child: Row(
                children: [
                  Icon(Icons.place_outlined, size: 22),
                  Text(" Sidi Abd El Rahman area", style: Styles.textStyle12),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: RatingTest(),
            ),
            const SizedBox(
              height: 20,
            ),
            // extract widget
            Padding(
              padding:
                  const EdgeInsets.only(top: 9, right: 15, left: 15, bottom: 9),
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
            )
          ],
        ),
      ),
    );
  }
}

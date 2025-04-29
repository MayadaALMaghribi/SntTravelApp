import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/reserve_room_button.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/custom_check_item.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/custom_dished_line.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/success_card.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(clipBehavior: Clip.none, children: [
          const SucessCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            left: 20 + 16,
            right: 20 + 16,
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            child: const CustomDishedLine(),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 - 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ReserveRoomButton(
                      text: "Confirm Payment",
                      ontap: () {
                        // TODO: Navigate or rebook
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ReserveRoomButton(
                      text: "Cancel Booking",
                      ontap: () {
                        // TODO: Navigate to home
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const CustomCheckItem()
        ]),
      ),
    );
  }
}

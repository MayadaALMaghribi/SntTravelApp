// import 'package:flutter/material.dart';
// import 'package:sntegpito/Features/hotels/presentation/views/widgets/reserve_room_button.dart';
// import 'package:sntegpito/Features/payment/presentation/views/widgets/custom_check_item.dart';
// import 'package:sntegpito/Features/payment/presentation/views/widgets/custom_dished_line.dart';
// import 'package:sntegpito/Features/payment/presentation/views/widgets/success_card.dart';

// class SuccessView extends StatelessWidget {
//   const SuccessView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Stack(clipBehavior: Clip.none, children: [
//           const SucessCard(),
//           Positioned(
//             bottom: MediaQuery.sizeOf(context).height * .2,
//             left: -20,
//             child: const CircleAvatar(
//               backgroundColor: Colors.white,
//             ),
//           ),
//           Positioned(
//             left: 20 + 16,
//             right: 20 + 16,
//             bottom: MediaQuery.sizeOf(context).height * .2 + 20,
//             child: const CustomDishedLine(),
//           ),
//           Positioned(
//             bottom: MediaQuery.sizeOf(context).height * .2 - 70,
//             left: 0,
//             right: 0,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: ReserveRoomButton(
//                       text: "Confirm Payment",
//                       ontap: () {
//                         // TODO: Navigate or rebook
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: ReserveRoomButton(
//                       text: "Cancel Booking",
//                       ontap: () {
//                         // TODO: Navigate to home
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: MediaQuery.sizeOf(context).height * .2,
//             right: -20,
//             child: const CircleAvatar(
//               backgroundColor: Colors.white,
//             ),
//           ),
//           const CustomCheckItem()
//         ]),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/reserve_room_button.dart';
import 'package:sntegpito/Features/payment/presentation/manager/get_details_booking_before_pay/get_details_booking_before_payment_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/custom_check_item.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/custom_dished_line.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/success_card.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({super.key});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  void initState() {
    super.initState();
    context.read<GetDetailsBookingBeforePaymentCubit>().getDetailsBooking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<GetDetailsBookingBeforePaymentCubit,
            GetDetailsBookingBeforePaymentState>(
          builder: (context, state) {
            if (state is GetDetailsBookingBeforePaymentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetDetailsBookingBeforePaymentFailure) {
              return Center(child: Text('Error: ${state.errmessage}'));
            } else if (state is GetDetailsBookingBeforePaymentSuccess) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  SucessCard(
                    model: state.detailsBookingBeforePaymentModel,
                  ),
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
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

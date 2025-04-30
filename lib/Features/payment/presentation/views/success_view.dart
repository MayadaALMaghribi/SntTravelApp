import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/reserve_room_button.dart';
import 'package:sntegpito/Features/payment/data/amount_paypall_model.dart';
import 'package:sntegpito/Features/payment/data/item_list_paypall_model.dart';
import 'package:sntegpito/Features/payment/data/items_paypal_model.dart';
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
                         const CustomPayListenr(),
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

class CustomPayListenr extends StatelessWidget {
  const CustomPayListenr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReserveRoomButton(
        text: "Confirm Payment",
        ontap: () {
        
        },
      ),
    );
  }
}


  // var amount = AmountPaypallModel(
  //                                 total: state.detailsBookingBeforePaymentModel
  //                                     .bookingDetails!.totalPrice
  //                                     .toString(),
  //                                 currency: "EGP",
  //                                 details: Details(
  //                                   subtotal: state
  //                                       .detailsBookingBeforePaymentModel
  //                                       .bookingDetails!
  //                                       .totalPrice
  //                                       .toString(),
  //                                   shipping: "0",
  //                                   shippingDiscount: 0,
  //                                 ),
  //                               );
  //                               List<Items> itemsRoom = [
  //                                 Items(
  //                                   name: state.detailsBookingBeforePaymentModel
  //                                       .bookingDetails!.room!.roomType,
  //                                   quantity: 1,
  //                                   price: state
  //                                       .detailsBookingBeforePaymentModel
  //                                       .bookingDetails!
  //                                       .totalPrice
  //                                       .toString(),
  //                                   currency: "EGP",
  //                                 ),
  //                               ];
  //                               var itemList =
  //                                   ItemListPaypallModel(items: itemsRoom);
  //                               Navigator.of(context).push(
  //                                 MaterialPageRoute(
  //                                   builder: (BuildContext context) =>
  //                                       PaypalCheckoutView(
  //                                     sandboxMode: true,
  //                                     clientId: "YOUR CLIENT ID",
  //                                     secretKey: "YOUR SECRET KEY",
  //                                     transactions: [
  //                                       {
  //                                         "amount": amount.toJson(),
  //                                         "description":
  //                                             "The payment transaction description.",
  //                                         "item_list": itemList.toJson(),
  //                                       }
  //                                     ],
  //                                     note:
  //                                         "Contact us for any questions on your order.",
  //                                     onSuccess: (Map params) async {
  //                                       log("onSuccess: $params" as num);
  //                                       Navigator.pop(context);
  //                                     },
  //                                     onError: (error) {
  //                                       log("onError: $error" as num);
  //                                       Navigator.pop(context);
  //                                     },
  //                                     onCancel: () {
  //                                       print('cancelled:');
  //                                       Navigator.pop(context);
  //                                     },
  //                                   ),
  //                                 ),
  //                               );
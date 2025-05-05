import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/payment/presentation/manager/get_details_booking_before_pay/get_details_booking_before_payment_cubit.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/custom_check_item.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/custom_dished_line.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/success_card.dart';

import '../../../../room/presentation/view/widgets/reserve_room_button.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
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
                  const CustomCheckItemIcon(),
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
                      child: ReserveRoomButton(
                        text: "Confirm Payment",
                        ontap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => CustomPayListenr()),
                          // );
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) {
                                return PaymentMethodBottomSheet(
                                  modelbooking:
                                      state.detailsBookingBeforePaymentModel,
                                );
                              });
                        },
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

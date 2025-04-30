import 'package:flutter/material.dart';
import 'package:sntegpito/Features/payment/data/details_booking_before_payment.dart';
import 'package:sntegpito/core/utils/styles.dart';

class SucessCard extends StatelessWidget {
  const SucessCard({
    super.key, required this.model,
  });
  final DetailsBookingBeforePaymentModel model;


  @override
  Widget build(BuildContext context) {
           final booking = model.bookingDetails!;
    final room = booking.room!;
          return Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50 + 16,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        "Booking Details Room",
                        style: Styles.textStyle22.copyWith(color: Colors.black),
                      ),
                    ),
                    DetailsSuccessCard(
                      text: "Start Date",
                      value: booking.startDate ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailsSuccessCard(
                      text: "End Date",
                      value: booking.endDate ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailsSuccessCard(
                      text: "Room Number",
                      value: room.roomNumber?.toString() ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailsSuccessCard(
                      text: "Room Type",
                      value: room.roomType ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailsSuccessCard(
                      text: "Number Of Guests",
                      value: booking.numberOfGuests?.toString() ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailsSuccessCard(
                      text: "Price Per Night",
                      value: room.pricePerNight?.toString() ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailsSuccessCard(
                      text: "Total Price",
                      value: booking.totalPrice?.toString() ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailsSuccessCard(
                      text: "Payment Status",
                      value: booking.paymentStatus ?? '',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Expired => ",
                          style: Styles.textStyle17,
                        ),
                        Text(
                          "10 minute",
                          style: Styles.textStyle20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );

  }
}

class DetailsSuccessCard extends StatelessWidget {
  const DetailsSuccessCard({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        10: IntrinsicColumnWidth(), // العرض حسب أطول عنصر
        1: FlexColumnWidth(), // يتمد بناءً على المساحة المتاحة
      },
      children: [
        TableRow(
          children: [
            Text(
              text,
              style: Styles.textStyle17,
            ),
            const Text(
              ":",
              style: Styles.textStyle17,
            ),
            Text(
              value,
              style: Styles.textStyle17,
            ),
          ],
        ),
      ],
    );
  }
}

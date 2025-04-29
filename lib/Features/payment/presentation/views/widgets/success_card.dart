import 'package:flutter/material.dart';
import 'package:sntegpito/core/utils/styles.dart';

class SucessCard extends StatelessWidget {
  const SucessCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              const DetailsSuccessCard(
                text: "Start Date :",
                value: '2025-6-5',
              ),
              const SizedBox(
                height: 10,
              ),
              const DetailsSuccessCard(
                text: "End Date ",
                value: '2025-6-6',
              ),
              const SizedBox(
                height: 10,
              ),
              const DetailsSuccessCard(
                text: "Room Number ",
                value: '5',
              ),
              const SizedBox(
                height: 10,
              ),
              const DetailsSuccessCard(
                text: "Room Type ",
                value: 'single',
              ),
              const SizedBox(
                height: 10,
              ),
              const DetailsSuccessCard(
                text: "Number Of Guests ",
                value: '1',
              ),
              const SizedBox(
                height: 10,
              ),
              const DetailsSuccessCard(
                text: "Price Per Night ",
                value: '300',
              ),
              const SizedBox(
                height: 10,
              ),
              const DetailsSuccessCard(
                text: "Total Price  ",
                value: '600',
              ),
              const SizedBox(
                height: 10,
              ),
              const DetailsSuccessCard(
                text: "Payment Status  ",
                value: "Pending",
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Expired  ",
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

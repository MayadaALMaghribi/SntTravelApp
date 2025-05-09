import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/views/widgets/custom_image_activity_booked.dart';
import '../../../../../core/utils/styles.dart';

class CustomCardActivityBooked extends StatelessWidget {
  const CustomCardActivityBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomImageActivityBooked(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 19),
              const Text(
                "headTiltle",
                style: Styles.textStyle17,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "title",
                style: Styles.textStyle20
                    .copyWith(color: Colors.black.withOpacity(0.4)),
              ),
              const SizedBox(height: 10),
              Text(
                "subtitle",
                style: Styles.textStyle15
                    .copyWith(color: Colors.black.withOpacity(0.5)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close_outlined),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

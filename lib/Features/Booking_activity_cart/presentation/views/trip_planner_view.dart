import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Booking_activity_cart/data/models/prepare_activity_model.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/views/widgets/trip_planner_view_body.dart';

class TripPlannerView extends StatelessWidget {
  const TripPlannerView(
      {super.key,
      required this.prepareActivityBookingModel,
      required this.price});
  final PrepareActivityBookingModel prepareActivityBookingModel;
  final int price;
  @override
  Widget build(BuildContext context) {
    return TripPlannerViewBody(
      prepareActivityBookingModel: prepareActivityBookingModel,
      price: price,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Booking_activity_cart/data/models/prepare_activity_model.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/views/widgets/trip_planner_view_body.dart';

class TripPlannerView extends StatelessWidget {
  const TripPlannerView({super.key, required this.prepareActivityBookingModel});
  final PrepareActivityBookingModel prepareActivityBookingModel;

  @override
  Widget build(BuildContext context) {
    return TripPlannerViewBody(
      prepareActivityBookingModel: prepareActivityBookingModel,
    );
  }
}

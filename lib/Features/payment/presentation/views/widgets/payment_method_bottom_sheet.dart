import 'package:flutter/material.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/list_payment_method_card.dart';

import '../../../data/models/details_booking_before_payment_model.dart';
import '../../../data/models/orginzation_models_booking/base_abstract_booking_data.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key, required this.baseBookingData});
  final BaseBookingData baseBookingData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [ListPaymentMethodCard(baseBookingData: baseBookingData)],
      ),
    );
  }
}
/**
 * import 'package:flutter/material.dart';
import 'package:sntegpito/Features/payment/presentation/views/widgets/list_payment_method_card.dart';

import '../../../data/models/details_booking_before_payment_model.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key, required this.modelbooking});
  final DetailsBookingBeforePaymentModel modelbooking;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [ListPaymentMethodCard(modelbooking: modelbooking)],
      ),
    );
  }
}
 */

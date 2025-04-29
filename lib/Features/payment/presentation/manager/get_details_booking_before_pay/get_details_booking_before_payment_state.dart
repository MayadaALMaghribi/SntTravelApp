part of 'get_details_booking_before_payment_cubit.dart';

@immutable
sealed class GetDetailsBookingBeforePaymentState {}

final class GetDetailsBookingBeforePaymentInitial
    extends GetDetailsBookingBeforePaymentState {}

final class GetDetailsBookingBeforePaymentLoading
    extends GetDetailsBookingBeforePaymentState {}

final class GetDetailsBookingBeforePaymentSuccess
    extends GetDetailsBookingBeforePaymentState {
  final DetailsBookingBeforePaymentModel detailsBookingBeforePaymentModel;

  GetDetailsBookingBeforePaymentSuccess(
      {required this.detailsBookingBeforePaymentModel});
}

final class GetDetailsBookingBeforePaymentFailure
    extends GetDetailsBookingBeforePaymentState {
  final dynamic errmessage;

  GetDetailsBookingBeforePaymentFailure({required this.errmessage});
}

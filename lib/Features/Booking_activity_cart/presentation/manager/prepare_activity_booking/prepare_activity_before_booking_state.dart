part of 'prepare_activity_before_booking_cubit.dart';

@immutable
sealed class PrepareActivityBeforeBookingState {}

final class PrepareActivityBeforeBookingInitial
    extends PrepareActivityBeforeBookingState {}

final class PrepareActivityBeforeBookingLoading
    extends PrepareActivityBeforeBookingState {}

final class PrepareActivityBeforeBookingSuccess
    extends PrepareActivityBeforeBookingState {
  final PrepareActivityBookingModel prepareActivityBookingModel;

  PrepareActivityBeforeBookingSuccess({required this.prepareActivityBookingModel});
}

final class PrepareActivityBeforeBookingFailure
    extends PrepareActivityBeforeBookingState {
  final dynamic errmessage;

  PrepareActivityBeforeBookingFailure({required this.errmessage});
}

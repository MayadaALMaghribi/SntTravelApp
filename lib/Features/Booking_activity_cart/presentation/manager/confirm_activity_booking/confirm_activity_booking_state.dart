part of 'confirm_activity_booking_cubit.dart';

@immutable
sealed class ConfirmActivityBookingState {}

final class ConfirmActivityBookingInitial extends ConfirmActivityBookingState {}

final class ConfirmActivityBookingLoading extends ConfirmActivityBookingState {}

final class ConfirmActivityBookingSuccess extends ConfirmActivityBookingState {
  final dynamic message;

  ConfirmActivityBookingSuccess({required this.message});
}

final class ConfirmActivityBookingFailure extends ConfirmActivityBookingState {
  final dynamic errmessage;

  ConfirmActivityBookingFailure({required this.errmessage});
}
